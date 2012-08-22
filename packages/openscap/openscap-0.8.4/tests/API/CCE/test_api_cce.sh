#!/usr/bin/env bash

# Copyright 2009 Red Hat Inc., Durham, North Carolina.
# All Rights Reserved.
#
# OpenScap CCE Module Test Suite.
#
# Created on: Dec 7, 2009
#
# Authors:
#      Ondrej Moris, <omoris@redhat.com>

# Test helpers.
. $srcdir/../../test_common.sh

# Test cases.

function test_api_cce_smoke {
    ./test_api_cce --smoke-test
    return $?
}

function test_api_cce_validate_valid_xml {
    ./test_api_cce --validate $srcdir/cce-sample.xml
    return $?
}

function test_api_cce_validate_invalid_xml {
    ! ./test_api_cce --validate $srcdir/cce-sample-invalid.xml
    return $?
}

function test_api_cce_validate_damaged_xml {
    ! ./test_api_cce --validate $srcdir/cce-sample-damaged.xml
    return $?
}

function test_api_cce_parse_xml {
    ./test_api_cce --parse $srcdir/cce-sample.xml > cce.out && \
	cmp cce.out $srcdir/cce.txt >&2
    return $?
}

function test_api_cce_search_existing {
    ./test_api_cce --search $srcdir/cce-sample.xml "CCE-3416-5" > cce.out && \
	cmp cce.out $srcdir/cce-1.txt >&2
    return $?
}

function test_api_cce_search_non_existing {
    ! ./test_api_cce --search $srcdir/cce-sample.xml "CCE-0000-0"
    return $?
}

# Testing.

test_init "test_api_cce.log" 

test_run "test_api_cce_smoke" test_api_cce_smoke
test_run "test_api_cce_validate_valid_xml" test_api_cce_validate_valid_xml
test_run "test_api_cce_validate_invalid_xml" test_api_cce_validate_invalid_xml
test_run "test_api_cce_validate_damaged_xml" test_api_cce_validate_damaged_xml
test_run "test_api_cce_parse_xml" test_api_cce_parse_xml
test_run "test_api_cce_search_existing" test_api_cce_search_existing
test_run "test_api_cce_search_non_existing" test_api_cce_search_non_existing

test_exit
