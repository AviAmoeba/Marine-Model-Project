
F_calc_func_2 <- function(basemodel) {
  
  model <- basemodel
  fishing_fleet_model <-StrathE2E2:::fishing_fleet_model
  
  shallowprop <- sum(model$data$physical.parameters$habitat_areas[1:4])
  deepprop_exOH <- sum(model$data$physical.parameters$habitat_areas[5:8])
  
  fleet_object <- fishing_fleet_model(model,2)
  fleet_vector	<- fleet_object$fleet_vector
  
  inshore <- c(fleet_vector["F_inshore_pelagic"],
                                    fleet_vector["F_inshore_demersal"],
                                    fleet_vector["F_inshore_migratory"],
                                    fleet_vector["F_inshore_filtben"],
                                    fleet_vector["F_inshore_carnben"],
                                    fleet_vector["F_inshore_carnzoo"],
                                    fleet_vector["F_inshore_bird"],
                                    fleet_vector["F_inshore_seal"],
                                    fleet_vector["F_inshore_ceta"],
                                    fleet_vector["F_inshore_kelp"])
  
  offshore <- c(fleet_vector["F_offshore_pelagic"],
                                     fleet_vector["F_offshore_demersal"],
                                     fleet_vector["F_offshore_migratory"],
                                     fleet_vector["F_offshore_filtben"],
                                     fleet_vector["F_offshore_carnben"],
                                     fleet_vector["F_offshore_carnzoo"],
                                     fleet_vector["F_offshore_bird"],
                                     fleet_vector["F_offshore_seal"],
                                     fleet_vector["F_offshore_ceta"],
                                     fleet_vector["F_offshore_kelp"])
  
  whole_domain <- numeric(10)
  
  whole_domain[c(1,2,3,6,7,8,9)] <- (inshore[c(1,2,3,6,7,8,9)]*shallowprop) + (offshore[c(1,2,3,6,7,8,9)]*(1-shallowprop))
  whole_domain[c(4,5,10)] <- ((inshore[c(4,5,10)]*shallowprop) + (offshore[c(4,5,10)]*(deepprop_exOH)))/(shallowprop+deepprop_exOH)
  
  return(whole_domain)
  
}




F_calc_func <- function(basemodel,dataset) {
  
  model<-basemodel
  fishing_fleet_model <- StrathE2E2:::fishing_fleet_model
  
  shallowprop<-sum(model$data$physical.parameters$habitat_areas[1:4])
  deepprop_exOH<-sum(model$data$physical.parameters$habitat_areas[5:8])
  
  grouplabels <- c(
    "Planktivorous_fish",
    "Demersal_fish",
    "Migratory_fish",
    "Benthos_susp-dep",
    "Benthos_carn-scav",
    "Zooplankton_carn",
    "Birds",
    "Pinnipeds",
    "Cetaceans",
    "Macrophytes"
  )
  
  fleet_object <- fishing_fleet_model(model,2)
  
  fleet_vector	<- fleet_object$fleet_vector
  
  zonalHRs<-data.frame(Guilds=grouplabels,Inshore_harvest_ratio=rep(0,length(grouplabels)),Offshore_harvest_ratio=rep(0,length(grouplabels)),Whole_domain_harvest_ratio=rep(0,length(grouplabels)))
  
  zonalHRs$Inshore_harvest_ratio<-c(fleet_vector["F_inshore_pelagic"],
                                    fleet_vector["F_inshore_demersal"],
                                    fleet_vector["F_inshore_migratory"],
                                    fleet_vector["F_inshore_filtben"],
                                    fleet_vector["F_inshore_carnben"],
                                    fleet_vector["F_inshore_carnzoo"],
                                    fleet_vector["F_inshore_bird"],
                                    fleet_vector["F_inshore_seal"],
                                    fleet_vector["F_inshore_ceta"],
                                    fleet_vector["F_inshore_kelp"])
  
  zonalHRs$Offshore_harvest_ratio<-c(fleet_vector["F_offshore_pelagic"],
                                     fleet_vector["F_offshore_demersal"],
                                     fleet_vector["F_offshore_migratory"],
                                     fleet_vector["F_offshore_filtben"],
                                     fleet_vector["F_offshore_carnben"],
                                     fleet_vector["F_offshore_carnzoo"],
                                     fleet_vector["F_offshore_bird"],
                                     fleet_vector["F_offshore_seal"],
                                     fleet_vector["F_offshore_ceta"],
                                     fleet_vector["F_offshore_kelp"])
  
  zonalHRs$Whole_domain_harvest_ratio[c(1,2,3,6,7,8,9)]<- (zonalHRs$Inshore_harvest_ratio[c(1,2,3,6,7,8,9)]*shallowprop) + (zonalHRs$Offshore_harvest_ratio[c(1,2,3,6,7,8,9)]*(1-shallowprop))
  zonalHRs$Whole_domain_harvest_ratio[c(4,5,10)]<- ((zonalHRs$Inshore_harvest_ratio[c(4,5,10)]*shallowprop) + (zonalHRs$Offshore_harvest_ratio[c(4,5,10)]*(deepprop_exOH)))/(shallowprop+deepprop_exOH)
  
  return(zonalHRs)
}
