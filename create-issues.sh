#!/bin/bash

issue_tittle=""
issue_text=""

while getopts ":d:r:u:p:" flag
do
	case "${flag}" in
	d) dir_name=$OPTARG;;
	r) repo_name=$OPTARG;;
	u) user_name=$OPTARG;;
	p) user_pat=$OPTARG;;
	*) echo "$1 is not an option" ;;
	esac
done

function create_issue(){
	curl -L \
		-X POST \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $user_pat"\
		-H "X-GitHub-Api-Version: 2022-11-28"\
		https://api.github.com/repos/$user_name/$repo_name/issues \
		-d "$(jq -n --arg title "$issue_title" --arg body "$issue_text" '{title:$title, body:$body}')"
}

FILES=(`find $dir_name -type f -name '*.txt' -printf '%f\n' | cut -f 1 -d '.'`)

for((i=0; i<${#FILES[@]}; i++))
do
	issue_title=${FILES[$i]}
	IFS= read -r -d '' issue_text <$dir_name/${FILES[$i]}.txt

	create_issue
done
