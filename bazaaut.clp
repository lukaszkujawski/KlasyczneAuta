;;; ***************************
;;; * deftemplates & deffacts BAZA AUT KLASYCZNYCH *
;;; ***************************

(deftemplate UI-state
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   

;;;****************
;;;* startup rule *
;;;****************

(defrule system-banner ""
=>
(assert (UI-state (display welcomemessage)
				(relation-asserted start)
				(state initial)
				(valid-answers))))

				
;;;***************
;;;* query rules *
;;;***************

(defrule determine-whyDoYouWant ""
	?state<-(UI-state)
    (not(whyDoYouWant))
    =>
	(retract ?state) 
	(assert (whyDoYouWant))	
    (assert (UI-state (display whyDoYouWantQuestion)
                     (relation-asserted whyDoYouWant)
                     (valid-answers notReliability wantStatement carsNoSoul preferStyle loveSpeed))))
					 
(defrule determine-whyNotReliability ""
	?state<-(UI-state)
	(not(whyNotReliability))
	(whyDoYouWant notReliability)
    =>
	(retract ?state)
	(assert (whyNotReliability))	
    (assert (UI-state (display whyNotReliabilityQuestion)
                     (relation-asserted whyNotReliability)
                     (valid-answers wantKnowCar towTrucks))))
					 
(defrule determine-sthSimple ""
	?state<-(UI-state)
	(not(sthSimple))
	(whyNotReliability wantKnowCar)
    =>
	(retract ?state)
	(assert (sthSimple))	
    (assert (UI-state (display sthSimpleQuestion)
                     (relation-asserted sthSimple)
                     (valid-answers sounds archaic notArchaic))))
					 
(defrule determine-prettyQuick ""
	?state<-(UI-state)
	(not(prettyQuick))
	(whyNotReliability towTrucks)
    =>
	(retract ?state)
	(assert (prettyQuick))	
    (assert (UI-state (display prettyQuickQuestion)
                     (relation-asserted prettyQuick)
                     (valid-answers reallyLovely no))))	

(defrule determine-whatStatement ""
	?state<-(UI-state)
	(not(whatStatement))
	(whyDoYouWant wantStatement)
    =>
	(retract ?state)
	(assert (whatStatement))	
    (assert (UI-state (display whatStatementQuestion)
                     (relation-asserted whatStatement)
                     (valid-answers richHippie mothershipParis nycInLasVegas dangerouslyNader driveTwoDistinct americanKook seriouslyGloves walletOnChain refugeeFuture partSubculture hatePeople motorcycleNoBalance))))					 
					 
(defrule determine-sthFaster ""
	?state<-(UI-state)
	(not(sthFaster))
	(whatStatement driveTwoDistinct)
    =>
	(retract ?state)
	(assert (sthFaster))	
    (assert (UI-state (display sthFasterQuestion)
                     (relation-asserted sthFaster)
                     (valid-answers yes no))))		

(defrule determine-evenFaster ""
	?state<-(UI-state)
	(not(evenFaster))
	(sthFaster yes)
    =>
	(retract ?state)
	(assert (evenFaster))	
    (assert (UI-state (display evenFasterQuestion)
                     (relation-asserted evenFaster)
                     (valid-answers yes no))))		

(defrule determine-notForStyle ""
	?state<-(UI-state)
	(not(notForStyle))
	(whatStatement walletOnChain)
    =>
	(retract ?state)
	(assert (notForStyle))	
    (assert (UI-state (display notForStyleQuestion)
                     (relation-asserted notForStyle)
                     (valid-answers yes no))))	

(defrule determine-whatKindOfStyle ""
	?state<-(UI-state)
	(not(whatKindOfStyle))
	(whyDoYouWant preferStyle)
    =>
	(retract ?state)
	(assert (whatKindOfStyle))	
    (assert (UI-state (display whatKindOfStyleQuestion)
                     (relation-asserted whatKindOfStyle)
                     (valid-answers dictator corvairsUniverse buckRogers chromeShirts slowCars brassLanterns museumWorthy heroBeer germanConfusion))))

(defrule determine-heroBeer ""
	?state<-(UI-state)
	(not(heroBeer))
	(whatKindOfStyle heroBeer)
    =>
	(retract ?state)
	(assert (heroBeer))	
    (assert (UI-state (display heroBeerQuestion)
                     (relation-asserted heroBeer)
                     (valid-answers yes no))))

(defrule determine-hatChevy ""
	?state<-(UI-state)
	(not(hatChevy))
	(heroBeer no)
    =>
	(retract ?state)
	(assert (hatChevy))	
    (assert (UI-state (display hatChevyQuestion)
                     (relation-asserted hatChevy)
                     (valid-answers lostMyHat soItDoes))))		

(defrule determine-fromTires ""
	?state<-(UI-state)
	(not(fromTires))
	(heroBeer yes)
    =>
	(retract ?state)
	(assert (fromTires))	
    (assert (UI-state (display fromTiresQuestion)
                     (relation-asserted fromTires)
                     (valid-answers undyingRespect noiseSmoke))))	

(defrule determine-realSpeed ""
	?state<-(UI-state)
	(not(realSpeed))
	(whyDoYouWant loveSpeed)
    =>
	(retract ?state)
	(assert (realSpeed))	
    (assert (UI-state (display realSpeedQuestion)
                     (relation-asserted realSpeed)
                     (valid-answers speedAndMoney deathWish fastCheap fakeIsFine))))	

(defrule determine-whoAreYou ""
	?state<-(UI-state)
	(not(whoAreYou))
	(realSpeed speedAndMoney)
    =>
	(retract ?state)
	(assert (whoAreYou))	
    (assert (UI-state (display whoAreYouQuestion)
                     (relation-asserted whoAreYou)
                     (valid-answers dukeRally childhoodPosters fetishReplica))))

(defrule determine-howToGo ""
	?state<-(UI-state)
	(not(howToGo))
	(realSpeed deathWish)
    =>
	(retract ?state)
	(assert (howToGo))	
    (assert (UI-state (display howToGoQuestion)
                     (relation-asserted howToGo)
                     (valid-answers tinySpace wiperSwitch blazeGlory carTree runOutOfTalent))))

(defrule determine-soulYou ""
	?state<-(UI-state)
	(not(soulYou))
	(whyDoYouWant carsNoSoul)
    =>
	(retract ?state)
	(assert (soulYou))	
    (assert (UI-state (display soulYouQuestion)
                     (relation-asserted soulYou)
                     (valid-answers abilityEstuary synonymWeird technicallyNovel honestJob ridingSofa starringMovies pureEvil deadClowns abilityMiles))))	

(defrule determine-likeWhat ""
	?state<-(UI-state)
	(not(likeWhat))
	(soulYou technicallyNovel)
    =>
	(retract ?state)
	(assert (likeWhat))	
    (assert (UI-state (display likeWhatQuestion)
                     (relation-asserted likeWhat)
                     (valid-answers metalHamantaschen cookingOil wrongPlace buildingPlane))))	

(defrule determine-fwdSofa ""
	?state<-(UI-state)
	(not(fwdSofa))
	(soulYou ridingSofa)
    =>
	(retract ?state)
	(assert (fwdSofa))	
    (assert (UI-state (display fwdSofaQuestion)
                     (relation-asserted fwdSofa)
                     (valid-answers yes no))))					 

					 

					 
;;; ***************************
;;; *  final  *  conclusions  *
;;; *************************** 


(defrule soundsFinal ""
  (sthSimple sounds)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display soundsFinal)
					(state final)
                    ))
)

(defrule fordModelA ""
  (sthSimple notArchaic)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display fordModelA)
					(state final)
                    ))
)

(defrule fordModelT ""
  (sthSimple archaic)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display fordModelT)
					(state final)
                    ))
)

(defrule LotusElan ""
  (prettyQuick no)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display LotusElan)
					(state final)
                    ))
)

(defrule AlfaRomeoGiuliaSuper ""
  (prettyQuick reallyLovely)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display AlfaRomeoGiuliaSuper)
					(state final)
                    ))
)

(defrule VWType2Microbus ""
  (whatStatement richHippie)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display VWType2Microbus)
					(state final)
                    ))
)

(defrule CitroenSM ""
  (whatStatement mothershipParis)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display CitroenSM)
					(state final)
                    ))
)

(defrule CheckerMarathon ""
  (whatStatement nycInLasVegas)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display CheckerMarathon)
					(state final)
                    ))
)

(defrule ChevyCorvair ""
  (whatStatement dangerouslyNader)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display ChevyCorvair)
					(state final)
                    ))
)

(defrule VWTypeIII ""
  (sthFaster no)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display VWTypeIII)
					(state final)
                    ))
)

(defrule deTomasoMangusta ""
  (evenFaster yes)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display deTomasoMangusta)
					(state final)
                    ))
)

(defrule porsche914 ""
  (evenFaster no)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display porsche914)
					(state final)
                    ))
)

(defrule americanKookFinal ""
  (whatStatement americanKook)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display americanKookFinal)
					(state final)
                    ))
)

(defrule seriouslyGlovesFinal ""
  (whatStatement seriouslyGloves)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display seriouslyGlovesFinal)
					(state final)
                    ))
)

(defrule ramblerAmerican ""
  (notForStyle yes)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display ramblerAmerican)
					(state final)
                    ))
)

(defrule notForStyleFinal ""
  (notForStyle no)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display notForStyleFinal)
					(state final)
                    ))
)

(defrule tatraT87 ""
  (whatStatement refugeeFuture)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display tatraT87)
					(state final)
                    ))
)

(defrule partSubcultureFinal ""
  (whatStatement partSubculture)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display partSubcultureFinal)
					(state final)
                    ))
)

(defrule hatePeopleFinal ""
  (whatStatement hatePeople)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display hatePeopleFinal)
					(state final)
                    ))
)

(defrule lotus7 ""
  (whatStatement motorcycleNoBalance)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display lotus7)
					(state final)
                    ))
)

(defrule dictatorFinal ""
  (whatKindOfStyle dictator)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display dictatorFinal)
					(state final)
                    ))
)

(defrule corvairsUniverseFinal ""
  (whatKindOfStyle corvairsUniverse)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display corvairsUniverseFinal)
					(state final)
                    ))
)

(defrule buckRogersFinal ""
  (whatKindOfStyle buckRogers)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display buckRogersFinal)
					(state final)
                    ))
)

(defrule buckRogersFinal ""
  (whatKindOfStyle buckRogers)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display buckRogersFinal)
					(state final)
                    ))
)

(defrule 57ChevyBelAir ""
  (whatKindOfStyle chromeShirts)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display 57ChevyBelAir)
					(state final)
                    ))
)

(defrule slowCarsFinal ""
  (whatKindOfStyle slowCars)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display slowCarsFinal)
					(state final)
                    ))
)

(defrule brassLanternsFinal ""
  (whatKindOfStyle brassLanterns)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display brassLanternsFinal)
					(state final)
                    ))
)

(defrule museumWorthyFinal ""
  (whatKindOfStyle museumWorthy)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display museumWorthyFinal)
					(state final)
                    ))
)

(defrule audi100 ""
  (whatKindOfStyle germanConfusion)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display audi100)
					(state final)
                    ))
)

(defrule amcAMX ""
  (hatChevy lostMyHat)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display amcAMX)
					(state final)
                    ))
)

(defrule chevyCamaro ""
  (hatChevy soItDoes)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display chevyCamaro)
					(state final)
                    ))
)

(defrule foxBodyMustang ""
  (fromTires undyingRespect)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display foxBodyMustang)
					(state final)
                    ))
)

(defrule noiseSmokeFinal ""
  (fromTires noiseSmoke)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display noiseSmokeFinal)
					(state final)
                    ))
)

(defrule lanciaStratos ""
  (whoAreYou dukeRally)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display lanciaStratos)
					(state final)
                    ))
)

(defrule childhoodPostersFinal ""
  (whoAreYou childhoodPosters)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display childhoodPostersFinal)
					(state final)
                    ))
)

(defrule fetishReplicaFinal ""
  (whoAreYou fetishReplica)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display fetishReplicaFinal)
					(state final)
                    ))
)

(defrule jaguarEType ""
  (howToGo wiperSwitch)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display jaguarEType)
					(state final)
                    ))
)

(defrule ferrariTestarossa ""
  (howToGo blazeGlory)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display ferrariTestarossa)
					(state final)
                    ))
)

(defrule carTreeFinal ""
  (howToGo carTree)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display carTreeFinal)
					(state final)
                    ))
)

(defrule porscheSpyder ""
  (howToGo runOutOfTalent)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display porscheSpyder)
					(state final)
                    ))
)

(defrule sunbeamTiger ""
  (howToGo tinySpace)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display sunbeamTiger)
					(state final)
                    ))
)

(defrule dodgeOmniGLH ""
  (realSpeed fastCheap)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display dodgeOmniGLH)
					(state final)
                    ))
)

(defrule fakeIsFineFinal ""
  (realSpeed fakeIsFine)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display fakeIsFineFinal)
					(state final)
                    ))
)

(defrule amphicar ""
  (soulYou abilityEstuary)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display amphicar)
					(state final)
                    ))
)

(defrule synonymWeirdFinal ""
  (soulYou synonymWeird)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display synonymWeirdFinal)
					(state final)
                    ))
)

(defrule mazdaRx7 ""
  (likeWhat metalHamantaschen)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display mazdaRx7)
					(state final)
                    ))
)

(defrule mercedesBenz300TD ""
  (likeWhat cookingOil)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display mercedesBenz300TD)
					(state final)
                    ))
)

(defrule wrongPlaceFinal ""
  (likeWhat wrongPlace)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display wrongPlaceFinal)
					(state final)
                    ))
)

(defrule saab96 ""
  (likeWhat buildingPlane)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display saab96)
					(state final)
                    ))
)

(defrule honestJobFinal ""
  (soulYou honestJob)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display honestJobFinal)
					(state final)
                    ))
)

(defrule lincolnTownCar ""
  (fwdSofa no)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display lincolnTownCar)
					(state final)
                    ))
)

(defrule oldsToronado ""
  (fwdSofa yes)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display oldsToronado)
					(state final)
                    ))
)

(defrule starringMoviesFinal ""
  (soulYou starringMovies)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display starringMoviesFinal)
					(state final)
                    ))
)

(defrule pureEvilFinal ""
  (soulYou pureEvil)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display pureEvilFinal)
					(state final)
                    ))
)

(defrule nashMetropolitan ""
  (soulYou deadClowns)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display nashMetropolitan)
					(state final)
                    ))
)

(defrule volvoP1800 ""
  (soulYou abilityMiles)
  ?state<-(UI-state)
  =>
  (retract ?state)
  (assert (UI-state (display volvoP1800)
					(state final)
                    ))
)
