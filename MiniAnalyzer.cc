// -*- C++ -*-
//
// Package:    Jets/MiniAnalyzer
// Class:      MiniAnalyzer
// 
/**\class MiniAnalyzer MiniAnalyzer.cc Jets/MiniAnalyzer/plugins/MiniAnalyzer.cc

 Description: [one line class summary]

 Implementation:
     [Notes on implementation]
*/
//
// Original Author:  Mohit Gola
//         Created:  Wed, 18 Jan 2017 11:10:19 GMT
//
//


// system include files
#include <memory>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/one/EDAnalyzer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "DataFormats/PatCandidates/interface/Jet.h"
#include "DataFormats/JetReco/interface/PFJetCollection.h"
#include "DataFormats/EgammaCandidates/interface/GsfElectron.h"
#include "DataFormats/PatCandidates/interface/VIDCutFlowResult.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"
#include "DataFormats/Common/interface/ValueMap.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/PatCandidates/interface/Electron.h"
#include "DataFormats/PatCandidates/interface/Muon.h"
#include "DataFormats/PatCandidates/interface/MET.h"
#include "DataFormats/PatCandidates/interface/Tau.h"
//
// class declaration
//

// If the analyzer does not use TFileService, please remove
// the template argument to the base class so the class inherits
// from  edm::one::EDAnalyzer<> and also remove the line from
// constructor "usesResource("TFileService");"
// This will improve performance in multithreaded jobs.

class MiniAnalyzer : public edm::one::EDAnalyzer<edm::one::SharedResources>  {
   public:
      explicit MiniAnalyzer(const edm::ParameterSet&);
      ~MiniAnalyzer();

      static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);


   private:
      virtual void beginJob() override;
      virtual void analyze(const edm::Event&, const edm::EventSetup&) override;
      virtual void endJob() override;

      // ----------member data ---------------------------

  edm::EDGetTokenT<pat::JetCollection> fatjetToken_;
  edm::EDGetTokenT<pat::ElectronCollection> electronToken_;
  edm::EDGetTokenT<reco::VertexCollection> vtxToken_;
  edm::EDGetTokenT<pat::MuonCollection> muonToken_;
  edm::EDGetTokenT<pat::METCollection> metToken_;
  edm::EDGetTokenT<pat::TauCollection> tauToken_;
  edm::EDGetTokenT<pat::JetCollection> jetToken_;
  edm::EDGetTokenT<edm::ValueMap<bool> > eleLooseIdMapToken_;
  edm::EDGetToken electronsMiniAODToken_;



  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;
  int count8 = 0;
  int count9 = 0;
  int count10 = 0;
  int count11 = 0;
  int count12 = 0;
  int count13 = 0;

};

//
// constants, enums and typedefs
//

//
// static data member definitions
//

//
// constructors and destructor
//
MiniAnalyzer::MiniAnalyzer(const edm::ParameterSet& iConfig):
  fatjetToken_(consumes<pat::JetCollection>(iConfig.getParameter<edm::InputTag>("fatjets"))),
  electronToken_(consumes<pat::ElectronCollection>(iConfig.getParameter<edm::InputTag>("electrons"))),
  vtxToken_(consumes<reco::VertexCollection>(iConfig.getParameter<edm::InputTag>("vertices"))),
  muonToken_(consumes<pat::MuonCollection>(iConfig.getParameter<edm::InputTag>("muons"))),
  metToken_(consumes<pat::METCollection>(iConfig.getParameter<edm::InputTag>("mets"))),
  tauToken_(consumes<pat::TauCollection>(iConfig.getParameter<edm::InputTag>("taus"))),
  jetToken_(consumes<pat::JetCollection>(iConfig.getParameter<edm::InputTag>("jets"))),
  eleLooseIdMapToken_(consumes<edm::ValueMap<bool> >(iConfig.getParameter<edm::InputTag>("eleLooseIdMap")))


{

  //  electronsMiniAODToken_    = mayConsume<edm::View<reco::GsfElectron> >(iConfig.getParameter<edm::InputTag>("electronsMiniAOD"));

   //now do what ever initialization is needed
   usesResource("TFileService");

}


MiniAnalyzer::~MiniAnalyzer()
{
 
   // do anything here that needs to be done at desctruction time
   // (e.g. close files, deallocate resources etc.)

}


//
// member functions
//

// ------------ method called for each event  ------------
void
MiniAnalyzer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
   using namespace edm;
   using namespace std;

   edm::Handle<pat::JetCollection> fatjets;
   iEvent.getByToken(fatjetToken_, fatjets);
   for (const pat::Jet &j : *fatjets)
     {
       //       cout<<j.partonFlavour()<<endl;
       if(j.pt() < 200) continue;
       if(!(100 < j.mass() && 150 > j.mass())) continue;
       if(!(fabs(j.eta()) < 2.4)) continue;
       count1++;
       if ((j.neutralHadronEnergyFraction() < 0.90 && j.neutralEmEnergyFraction() < 0.90 && (j.chargedMultiplicity()+j.neutralMultiplicity()) > 1) &&(abs(j.eta()) <= 2.4 && j.chargedHadronEnergyFraction() > 0 && j.chargedMultiplicity() > 0 && j.chargedEmEnergyFraction() < 0.99))
         {
	   count2++;

         }
       if(!(fabs(j.partonFlavour()) == 5)) continue;
       if(!(j.bDiscriminator("pfCombinedInclusiveSecondaryVertexV2BJetTags") > 0.46)) continue;

       std::vector<reco::Candidate const *> constituents;
       for ( unsigned ida = 0; ida < j.numberOfDaughters(); ++ida )
	 {

	   reco::Candidate const * cand = j.daughter(ida);
	   if ( cand->numberOfDaughters() == 2 )
	     {
	       for ( unsigned jda = 0; jda < cand->numberOfDaughters(); ++jda )
                 {
		   reco::Candidate const * cand2 = cand->daughter(jda);
		   constituents.push_back( cand2 );
                 }
	     }
	 }


       std::sort( constituents.begin(), constituents.end(), [] (reco::Candidate const * ida, reco::Candidate const * jda){return ida->pt() > jda->pt();} );
       for ( unsigned int ida = 0; ida < constituents.size(); ++ida ) 
	 {
	   const pat::PackedCandidate &cand = dynamic_cast<const pat::PackedCandidate &>(*constituents[ida]);
	   //	   cout<<cand.pdgId()<<endl;
	   count11++;
	 }


     }







   edm::Handle<reco::VertexCollection> vertices;
   iEvent.getByToken(vtxToken_, vertices);
   if (vertices->empty()) return;
   const reco::Vertex &PV = vertices->front();



   /*
      edm::Handle<edm::ValueMap<bool> > loose_id_decisions;
     iEvent.getByToken(eleLooseIdMapToken_ ,loose_id_decisions);


   
   edm::Handle<edm::View<reco::GsfElectron> > electrons;
   bool isAOD = true;
   
   if( !electrons.isValid() ){
     isAOD = false;
     iEvent.getByToken(electronsMiniAODToken_,electrons);
   }
   cout<<isAOD<<endl;
   

   
      edm::Handle<pat::ElectronCollection> electrons;
      iEvent.getByToken(electronToken_, electrons);
      
   for (size_t i = 0; i < electrons->size(); ++i)
     {
       const auto el = electrons->ptrAt(i);
       
       bool isPassLoose  = (*loose_id_decisions)[el];                                                                                                                            

       if(isPassLoose == true)                                                                                                                                                    
	 {                                                                                                                                                                        
	   count10++;                                                                                                                                                             
	 } 


     }


   
     
      for (const pat::Electron &el : *electrons)
   
        {
          bool isPassLoose  = (*loose_id_decisions)[el];   
          
             if(isPassLoose == true)
   	    {
   	      count10++;
   	    }
   
      }
    
    if(!(el.pt() > 10)) continue;
       
       if(fabs(el.superCluster()->eta())<=1.479)
	 {

	   if(el.full5x5_sigmaIetaIeta() < 0.0103 && el.deltaEtaSuperClusterTrackAtVtx() < 0.0105 && el.deltaPhiSuperClusterTrackAtVtx() < 0.115 && el.hadronicOverEm() < 0.104 && fabs(1.0 -el.eSuperClusterOverP())*(1.0/el.ecalEnergy()) < 0.102 && el.gsfTrack()->dxy(PV.position()) < 0.0261 && el.gsfTrack()->dz(PV.position()) < 0.41 && el.gsfTrack()->hitPattern().numberOfHits(reco::HitPattern::MISSING_INNER_HITS) < 3 &&  el.passConversionVeto())
	     {
	       count3++;

	     }

	 }
     

       if(fabs(el.superCluster()->eta()) > 1.479 && 2.5 < fabs(el.superCluster()->eta()))
         {

           if(el.full5x5_sigmaIetaIeta() < 0.0301 && el.deltaEtaSuperClusterTrackAtVtx() < 0.00814 && el.deltaPhiSuperClusterTrackAtVtx() < 0.182 && el.hadronicOverEm() < 0.0897 && fabs(1.0 -el.eSuperClusterOverP())*(1.0/el.ecalEnergy()) < 0.126 && el.gsfTrack()->dxy(PV.position()) < 0.118 && el.gsfTrack()->dz(PV.position()) < 0.882 && el.gsfTrack()->hitPattern().numberOfHits(reco::HitPattern::MISSING_INNER_HITS) < 2 &&  el.passConversionVeto())
             {
               count4++;

             }

         }


   */







     

     





     



   edm::Handle<pat::MuonCollection> muons;
   iEvent.getByToken(muonToken_, muons);

   for (const pat::Muon &mu : *muons)
     {

       if (!(mu.pt() > 10)) continue;
       if(!(fabs(mu.eta()) < 2.4)) continue;
       if (!((mu.pfIsolationR04().sumChargedHadronPt + max(0., mu.pfIsolationR04().sumNeutralHadronEt + mu.pfIsolationR04().sumPhotonEt - 0.5*mu.pfIsolationR04().sumPUPt))/mu.pt() < 0.4)) continue;
     
       if(mu.isGlobalMuon() && mu.numberOfMatchedStations() > 1 && mu.innerTrack()->hitPattern().numberOfValidPixelHits() > 0 && mu.muonBestTrack()->dxy(PV.position()) < 0.2 && mu.muonBestTrack()->dz(PV.position())<0.5 && mu.innerTrack()->hitPattern().trackerLayersWithMeasurement() > 5 && ((mu.innerTrack()->ptError())/(mu.innerTrack()->pt())) < 0.3 &&  mu.globalTrack()->hitPattern().numberOfValidMuonHits() > 0)
	 {

	   count5++;
	   
	 }


     }



   edm::Handle<pat::METCollection> mets;
   iEvent.getByToken(metToken_, mets);
   const pat::MET &met = mets->front();
   if (met.pt() > 200)
     {
       count6++;

     }


   edm::Handle<pat::TauCollection> taus;
   iEvent.getByToken(tauToken_, taus);
   for (const pat::Tau &tau : *taus)
     {
       bool decaymodefinding = tau.tauID("decayModeFinding") ;
       bool byLooseCombinedIsolation =tau.tauID("byLooseCombinedIsolationDeltaBetaCorr3Hits") ;
       
       if (!(tau.pt() > 20)) continue;
       if (!(fabs(tau.eta()) < 2.3)) continue;

       if(decaymodefinding == true && byLooseCombinedIsolation == true)
	 {
	   count7++;
	 }

     }



   edm::Handle<pat::JetCollection> jets;
   iEvent.getByToken(jetToken_, jets);
   //   cout<<jets->size();
   for (const pat::Jet &j : *jets)
     {
       //       cout<<j.userFloat("pileupJetId:fullDiscriminant")<<endl;
       if (j.pt() < 30) continue;
       if(fabs(j.eta()) < 4.5) 
	 {

	   if((((j.neutralHadronEnergyFraction() < 0.99 && j.neutralEmEnergyFraction() < 0.99 && (j.chargedMultiplicity()+j.neutralMultiplicity()) > 1) && ((fabs(j.eta()) < 2.4 && j.chargedHadronEnergyFraction() > 0 && j.chargedMultiplicity() > 0 && j.chargedEmEnergyFraction()<0.99) || fabs(j.eta()) > 2.4) && fabs(j.eta()) <= 2.7) || (j.neutralHadronEnergyFraction() < 0.98 && j.neutralEmEnergyFraction() > 0.01 && j.neutralMultiplicity() > 2 && fabs(j.eta()) > 2.7 && fabs(j.eta()) <= 3.0) || (j.neutralEmEnergyFraction() < 0.9 && j.neutralMultiplicity() > 10 && fabs(j.eta()) > 3.0)) && jets->size() == 1) 
	     {
	       count8++;
	     }
       
	 }
       


	   
       if(!(fabs(j.eta()) < 2.4)) continue;
       if (jets->size() == 0 && j.bDiscriminator("pfCombinedInclusiveSecondaryVertexV2BJetTags") > 0.46)
	 {
	   count9++;
	 }



       


     }








#ifdef THIS_IS_AN_EVENT_EXAMPLE
   Handle<ExampleData> pIn;
   iEvent.getByLabel("example",pIn);
#endif
   
#ifdef THIS_IS_AN_EVENTSETUP_EXAMPLE
   ESHandle<SetupData> pSetup;
   iSetup.get<SetupRecord>().get(pSetup);
#endif
}


// ------------ method called once each job just before starting event loop  ------------
void 
MiniAnalyzer::beginJob()
{
}

// ------------ method called once each job just after ending the event loop  ------------
void 
MiniAnalyzer::endJob() 
{
  using namespace std;
  cout<<"Count1 : "<<count1
      <<"\nCount2 : "<<count2
      <<"\nCount3 : "<<count3
      <<"\nCount4 : "<<count4
      <<"\nCount5 : "<<count5
      <<"\nCount6 : "<<count6
      <<"\nCount7 : "<<count7
      <<"\nCount8 : "<<count8
      <<"\nCount9 : "<<count9
      <<"\nCount10 : "<<count10
      <<"\nCount11 : "<<count11
      <<endl;

}

// ------------ method fills 'descriptions' with the allowed parameters for the module  ------------
void
MiniAnalyzer::fillDescriptions(edm::ConfigurationDescriptions& descriptions) {
  //The following says we do not know what parameters are allowed so do no validation
  // Please change this to state exactly what you do use, even if it is no parameters
  edm::ParameterSetDescription desc;
  desc.setUnknown();
  descriptions.addDefault(desc);
}

//define this as a plug-in
DEFINE_FWK_MODULE(MiniAnalyzer);
