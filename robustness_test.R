source('modified_random_tf.r')



setwd('your_address')

#figure attributes
dpi <- 300
width <- 800*2
height <- 500*2



#SMPDSv1

recon_matrix = read.csv('po19_test_abund.csv')[,-1]  #
out_put_ml <- randomTF_ml(spp = sqrt(sp_m), env = env,  #
                          fos = sqrt(cores),recon_matrix=recon_matrix)  #
png('stack_recon_po19.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MTCO")
dev.off()
recon_matrix = read.csv('po19_test_comb.csv')[,-1]  #
out_put_ml <- randomTF_ml(spp = sqrt(sp_m), env = env,  #
                          fos = sqrt(cores),recon_matrix=recon_matrix)  #
png('stack_recon_po19_comb.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MTCO")
dev.off()
out_put_ml <- randomTF_v2(spp = sqrt(sp_m), env = env,
                          fos = sqrt(cores), n = 999, fun = WAPLS, col = 2)
#png('po19_wapls.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MTCO")
dev.off()


# NIMBIOS

sp_m =  read.csv('data/MP20_abund.csv',header = 1)[,c(-1,-2)]
for (i in 1:dim(sp_m)[2])
  sp_m [,i] <- as.numeric(sp_m [,i] )
for (i in 1:dim(sp_m)[1]){
  sp_m[i,] = sp_m[i,]/sum(sp_m[i,])
}
env = read.csv('data/MP20_env.csv',header = 1)$MAT
env <- (as.numeric(env))
cores = read.csv('data/lla.csv',header = 1)[,-1]
for (i in 1:dim(cores)[2])
  cores [,i] <- as.numeric(cores[,i] )
for (i in 1:dim(cores)[1]){
  cores[i,] = cores[i,]/sum(cores[i,])
}

recon_matrix = read.csv('lla_test_abund')[,-1]  #
out_put_ml <- randomTF_ml(spp = sqrt(sp_m), env = env,  #
                          fos = sqrt(cores),recon_matrix=recon_matrix)  #
png('stack_recon_lla.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MAT")
dev.off()
recon_matrix = read.csv('lla_test_comb')[,-1]  #
out_put_ml <- randomTF_ml(spp = sqrt(sp_m), env = env,  #
                          fos = sqrt(cores),recon_matrix=recon_matrix)  #
png('stack_recon_lla_ae.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MAT")
dev.off()
out_put_ml <- randomTF_v2(spp = sqrt(sp_m), env = env,
                          fos = sqrt(cores), n = 999, fun = WAPLS, col = 2)
png('lla_wapls.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MAT")
dev.off()

cores = read.csv('data/mos.csv',header = 1)[,-1]
for (i in 1:dim(cores)[2])
  cores [,i] <- as.numeric(cores[,i] )
for (i in 1:dim(cores)[1]){
  cores[i,] = cores[i,]/sum(cores[i,])
}

recon_matrix = read.csv('lla_test_comb.csv')[,-1]  #
out_put_ml <- randomTF_ml(spp = sqrt(sp_m), env = env,  #
                          fos = sqrt(cores),recon_matrix=recon_matrix)  #
png('stack_recon_mos.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MAT")
dev.off()
recon_matrix = read.csv('mos_test_combt.csv')[,-1]  #
out_put_ml <- randomTF_ml(spp = sqrt(sp_m), env = env,  #
                          fos = sqrt(cores),recon_matrix=recon_matrix)  #
png('stack_recon_mos_comb.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MAT")
dev.off()
out_put_ml <- randomTF_v2(spp = sqrt(sp_m), env = env,
                          fos = sqrt(cores), n = 999, fun = WAPLS, col = 2)
png('mos_wapls.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "MAT")
dev.off()



# SWAP
data(SWAP)
sp_m = SWAP$spec 
env = SWAP$pH
cores = read.csv('data/rlgh3.csv',header = 1)[,-1]/100
recon_matrix = read.csv('rlgh3_test_abund.csv')[,-1]  #_2707
out_put_ml <- randomTF_ml(spp = (sp_m), env = env,  #
                          fos = (cores),recon_matrix=recon_matrix)  #
png('stack_recon_rlgh3.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "pH")
dev.off()
recon_matrix = read.csv('rlgh3_test_comb.csv')[,-1]  #
out_put_ml <- randomTF_ml(spp = (sp_m), env = env,  #
                          fos = (cores),recon_matrix=recon_matrix)  #
png('stack_recon_rlgh3_comb.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "pH")
dev.off()
out_put_ml <- randomTF_v2(spp = (sp_m), env = env,
                          fos = (cores), n = 999, fun = WAPLS, col = 1)
png('rlgh3_wapls.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "pH")
dev.off()
sp_m = SWAP$spec 
env = SWAP$pH
cores = read.csv('data/rlgh_spec.csv',header = 1)[,-1]#/100
recon_matrix = read.csv('rlgh_test_abund.csv')[,-1]  #2707
out_put_ml <- randomTF_ml(spp = (sp_m), env = env,  #
                          fos = (cores),recon_matrix=recon_matrix)  #
png('stack_recon_rlgh.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "pH")
dev.off()
recon_matrix = read.csv('rlgh_test_comb.csv')[,-1]  #
out_put_ml <- randomTF_ml(spp = (sp_m), env = env,  #
                          fos = (cores),recon_matrix=recon_matrix)  #
png('stack_recon_rlgh_comb.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "pH")
dev.off()
out_put_ml <- randomTF_v2(spp = (sp_m), env = env,
                          fos = (cores), n = 999, fun = WAPLS, col = 1)
png('rlgh_wapls.png', width = width, height = height, units = "px", res = dpi)
autoplot(out_put_ml, "pH")
dev.off()
