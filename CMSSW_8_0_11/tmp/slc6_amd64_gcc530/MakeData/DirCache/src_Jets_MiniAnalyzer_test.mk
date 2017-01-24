ALL_COMMONRULES += src_Jets_MiniAnalyzer_test
src_Jets_MiniAnalyzer_test_parent := Jets/MiniAnalyzer
src_Jets_MiniAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Jets_MiniAnalyzer_test,src/Jets/MiniAnalyzer/test,TEST))
