#!/usr/bin/env python3
import os
import sys
import re
import subprocess
from notion_client import Client
from dotenv import load_dotenv

load_dotenv()
notion = Client(auth=os.getenv("NOTION_TOKEN"))
DATABASE_ID = os.getenv("NOTION_DATABASE_ID")
# GITHUB_REPO = os.getenv("GITHUB_REPOSITORY", "username/repo")
SOLUTIONS_PATH = os.getenv("SOLUTIONS_PATH", "solutions")

def extract_problem_id(filename):
    return filename.split("-")[1]
 

def get_github_link(filepath, repo):
    """Generate GitHub blob link."""
    try:
        branch = subprocess.check_output(
            ["git", "rev-parse", "--abbrev-ref", "HEAD"],
            text=True
        ).strip()
    except:
        branch = "main"
    
    rel_path = filepath.replace("\\", "/")
    return f"https://github.com/{repo}/blob/{branch}/{rel_path}"


def get_staged_solution_files():
    """Get solution files from current commit."""
    try:
        result = subprocess.check_output(
            ["git", "diff", "--cached", "--name-only", "--diff-filter=AM"],
            text=True
        )
        files = result.strip().split("\n")
        solution_exts = [".ua"]
        return [f for f in files if f.startswith(SOLUTIONS_PATH) and any(f.endswith(ext) for ext in solution_exts)]
    except:
        return []


def update_notion_for_file(filepath):
    """Update Notion for a solution file."""
    problem_id = extract_problem_id(filepath)
    with open(filepath) as file:
        code = file.read()
    if not problem_id:
        print(f"  ⚠️  Could not extract problem ID from: {filepath}")
        return False
    
    try:
        results = notion.databases.query(
            database_id=DATABASE_ID,
            filter={"property": "Problem ID", "rich_text": {"equals": problem_id}}
        )
        
        if not results["results"]:
            print(f"  ⚠️  Problem {problem_id} not found in Notion")
            return False
        
        page = results["results"][0]
        for block in notion.blocks.children.list(page['id']).get("results", []):
            notion.blocks.delete(block_id=block.get('id'))
        notion.blocks.children.append(
            page["id"],
            children=[
                {
                    "object": "block",
                    "type": "code",
                    "code": {
                        "rich_text": [
                            {
                                "type": "text",
                                "text": {
                                    "content": code
                                },
                                "plain_text": code,
                            }
                        ],

                        "language": "elixir",
                    }
                }
            ]
        )
        
        problem_name = page["properties"]["Problem"]["title"][0]["text"]["content"]
        print(f"  ✅ {problem_id}: {problem_name}")
        return True
        
    except Exception as e:
        print(f"  ❌ Error: {str(e)}")
        return False


def main():
    solution_files = get_staged_solution_files()
    
    if not solution_files:
        sys.exit(0)
    
    print("\n🔄 Syncing solutions to Notion...")
    print(f"📁 Found {len(solution_files)} solution file(s)\n")
    
    success_count = sum(1 for f in solution_files if update_notion_for_file(f))
    print(f"\n✅ Synced {success_count}/{len(solution_files)} solution(s)!")
    sys.exit(0)


if __name__ == "__main__":
    main()
