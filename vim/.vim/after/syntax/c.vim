" Qumulo Color Matching
" Copy this file to ~/.vim/after/syntax/c.vim

" _var definitions
syn match qVar "\v\k+_var>"
hi def link qVar Type

" global variables
syn keyword qGlobalVar global_variable
hi def link qGlobalVar Type

" foreach loops
syn keyword qForeachSingle foreach
hi def link qForeachSingle Repeat

" restart loops
syn match qRestartLoop "\v\k+_run_restartable>"
hi def link qRestartLoop Repeat

" with
syn keyword qWith with with_scope with_transaction
hi def link qWith Label

" patch
syn keyword qPatchable PATCHABLE
hi def link qPatchable Statement

" GENERATE
syn keyword qGen GENERATE a_generate module_define module_define_for_file linker_set_requires STRINGIFY
hi def link qGen Statement

" error handling
syn keyword qErr epanic ereturn eignore eforward
hi def link qErr Statement

" test
syn keyword qTEST TEST FIXTURE_SET_UP FIXTURE_TEAR_DOWN
hi def link qTEST Type

" compiler flags
syn keyword qFLAGS a_warn_unused_result a_aligned a_packed a_transparent_union a_unused a_cleanup a_format_qumulo a_no_inline a_warn_unused_result a_weak a_interface_method a_getter a_setter a_implements a_overloadable
hi def link qFLAGS Label

" asserts
syn keyword qASSERTS assert assert_false assert_implies assert_iff panic assert_equal assert_not_equal assert_less assert_not_less assert_less_equal assert_not_less_equal assert_greater assert_not_greater assert_greater_equal assert_not_greater_equal assert_between_upper_exclusive assert_between_exclusive assert_between_inclusive assert_between_epsilon assert_equal_epsilon assert_matches assert_null assert_not_null assert_empty assert_not_empty assert_size assert_valid assert_not_valid assert_memory_equal assert_contains assert_not_contains assert_locked assert_unlocked assert_rlocked assert_wlocked assert_runlocked assert_wunlocked assert_subset assert_not_subset assert_superset assert_not_superset assert_disjoint assert_not_disjoint assert_fmt must_be_true must_be_false assert_debug assert_xor assert_error_is_class
hi def link qASSERTS Statement

" Qumulo Style end
