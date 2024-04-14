
library('rioja')
setwd('')  ## your address


# reconstruct the palaeo environment
perform_and_write_wa_wapls <- function(sp_m, env, core_name) {
  # WAPLS
  fit_wapls <- WAPLS(sp_m, env)
  pred_wapls <- predict(fit_wapls, cores)$fit
  write.csv(pred_wapls, paste("WAPLS_", core_name, ".csv", sep = ""))
  
  # WA
  fit_wa <- WA(sp_m, env)
  pred_wa <- predict(fit_wa, cores)$fit
  write.csv(pred_wa, paste("WA_", core_name, ".csv", sep = ""))
}

# cross validation
perform_cross_validation <- function(env, sp_m, doc_name,seed_no = 0) {
  set.seed(seed_no)
  t_length <- length(env)
  re_index <- sample(t_length)
  cut_len <- ceiling(t_length / 5)
  cut1 <- 1
  cut2 <- cut_len
  
  for (i in 1:5) {
    if (t_length <= cut1) break
    
    if (t_length < cut2) cut2 <- t_length
    
    sub <- cut1:cut2
    train_x <- sp_m[-re_index[sub], ]
    train_y <- env[-re_index[sub]]
    test_y <- env[re_index[sub]]
    test_x <- sp_m[re_index[sub], ]
    test_x <- test_x[, which(colSums(train_x) > 0)]
    train_x <- train_x[, which(colSums(train_x) > 0)]
    
    fit_wapls <- WAPLS(train_x, train_y)
    fit_wa <- WA(train_x, train_y)
    
    pred_wapls <- predict(fit_wapls, test_x)
    pred_wa <- predict(fit_wa, test_x)
    
    if (i == 1) {
      t_matrix <- cbind(pred_wa$fit, pred_wapls$fit, test_y)
    } else {
      t_matrix <- rbind(t_matrix, cbind(pred_wa$fit, pred_wapls$fit, test_y))
    }
    
    cut1 <- cut1 + cut_len
    cut2 <- cut2 + cut_len
  }
  
  write.csv(t_matrix, paste("classical_cv/", doc_name, '_',seed_no,"_cv.csv", sep = ""))
}

data(SWAP)     
sp_m = SWAP$spec/100 # keep the percentage form
env = SWAP$pH #rioja package should inculde both 
doc_name = "swap"
cores = read.csv('rlgh_spec.csv',header = 1)[,-1]/100 # keep the percentage form
for (i in 1:5){
  seed_no = i
  perform_cross_validation (env, sp_m, doc_name,seed_no = i)
}
cores = read.csv('D:/MEE/data/rlgh3.csv',header = 1)[,-1]
perform_and_write_wa_wapls(sp_m,env,cores,'rlgh3')
cores = SWAP$rlgh
perform_and_write_wa_wapls(sp_m,env,cores,'rlgh')



env = read.csv('Pollen site Climate.csv',header = 1)[,-1]$MTCO
sp_m = read.csv('SMPDS_Feb2019.csv',header = 1)[,-1]  
#sp_m = sp_m[, 5:ncol(sp_m)]   ## please check the table only include the taxa columns
#sp_m = sp_m[,5:dim(sp_m)[2]]
doc_name = "po19"
cores = read.csv('po19_core.csv',header = 1)[,-1] # El Cañizar de Villarquemado data set
num_rows <- nrow(cores)
for (i in 1:num_rows) {
  cores[i, ] <- cores[i, ] / sum(cores[i, ]) # keep the percentage form
}
#run the model with 5-fold validation
for (i in 1:5){
  seed_no = i
  perform_cross_validation (env, sp_m, doc_name,seed_no = i)
}

perform_and_write_wa_wapls(sp_m,env,cores,doc_name)




env = read.csv('MP20_env.csv',header = 1)[,-1]$MAT/10 # change the unit
sp_m = read.csv('MP20_abund.csv',header = 1)[,-1] # Modern pollen 2020 data set
sp_m <- sapply(sp_m, as.numeric)

doc_name = "MP20"
sp_m = sp_m[, 3:ncol(sp_m)]
cores = read.csv('mos.csv',header = 1)[,-1]
#cores <- cores[cores$rownames == 'CON1', ]
for (i in 1:5){
  seed_no = i
  perform_cross_validation (env, sp_m, doc_name,seed_no = i)
}

perform_and_write_wa_wapls(sp_m,env,cores,'mp20')
cores = read.csv('lla.csv',header = 1)[,-1]
perform_and_write_wa_wapls(sp_m,env,cores,'mp20')



