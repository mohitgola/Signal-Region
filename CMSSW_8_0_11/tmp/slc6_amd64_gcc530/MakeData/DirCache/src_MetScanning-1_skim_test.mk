ALL_COMMONRULES += src_MetScanning-1_skim_test
src_MetScanning-1_skim_test_parent := MetScanning-1/skim
src_MetScanning-1_skim_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MetScanning-1_skim_test,src/MetScanning-1/skim/test,TEST))
