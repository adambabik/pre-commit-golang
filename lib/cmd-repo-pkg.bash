# shellcheck shell=bash

. "$(dirname "${0}")/lib/common.bash"

prepare_repo_hook_cmd "$@"

if [ "${use_dot_dot_dot:-}" -eq 1 ]; then
	OPTIONS+=('./...')
fi
export GO111MODULE=off
if [ "${error_on_output:-}" -eq 1 ]; then
	output=$("${cmd[@]}" "${OPTIONS[@]}" 2>&1)
	if [ -n "${output}" ]; then
		printf "%s\n" "${output}"
		exit 1
	fi
else
	"${cmd[@]}" "${OPTIONS[@]}"
fi
