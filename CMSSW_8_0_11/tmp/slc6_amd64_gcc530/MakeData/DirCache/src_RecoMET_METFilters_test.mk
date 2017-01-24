ALL_COMMONRULES += src_RecoMET_METFilters_test
src_RecoMET_METFilters_test_parent := RecoMET/METFilters
src_RecoMET_METFilters_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METFilters_test,src/RecoMET/METFilters/test,TEST))
