\n\n#---------------------------------
# New invocation of recon-all Tue Jun 27 21:57:11 EDT 2017 
\n mri_convert /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/mris/hydration-experiment/nii.gz/dehydrated-day/FSSUM-1/GR_IR-Siemens_MPRAGEa.nii.gz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig/001.mgz \n
\n\n#---------------------------------
# New invocation of recon-all Tue Jun 27 22:53:57 EDT 2017 
#--------------------------------------------
#@# MotionCor Tue Jun 27 22:54:02 EDT 2017
\n cp /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig/001.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/rawavg.mgz \n
\n mri_convert /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/rawavg.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig.mgz --conform \n
\n mri_add_xform_to_header -c /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/transforms/talairach.xfm /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Tue Jun 27 22:54:15 EDT 2017
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --n 1 --proto-iters 1000 --distance 50 \n
\n talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm --atlas 3T18yoSchwartzReactN32_as_orig \n
talairach_avi log file is transforms/talairach_avi.log...
\n cp transforms/talairach.auto.xfm transforms/talairach.xfm \n
#--------------------------------------------
#@# Talairach Failure Detection Tue Jun 27 22:56:26 EDT 2017
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
\n awk -f /Volumes/CFMI-CFS/opt/fs6/bin/extract_talairach_avi_QA.awk /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/transforms/talairach_avi.log \n
\n tal_QC_AZS /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/transforms/talairach_avi.log \n
#--------------------------------------------
#@# Nu Intensity Correction Tue Jun 27 22:56:26 EDT 2017
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --proto-iters 1000 --distance 50 --n 1 \n
\n mri_add_xform_to_header -c /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Tue Jun 27 22:58:24 EDT 2017
\n mri_normalize -g 1 -mprage nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Tue Jun 27 23:00:35 EDT 2017
\n mri_em_register -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mri_em_register.skull.dat -skull nu.mgz /Volumes/CFMI-CFS/opt/fs6/average/RB_all_withskull_2016-05-10.vc700.gca transforms/talairach_with_skull.lta \n
\n mri_watershed -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mri_watershed.dat -T1 -brain_atlas /Volumes/CFMI-CFS/opt/fs6/average/RB_all_withskull_2016-05-10.vc700.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz \n
\n cp brainmask.auto.mgz brainmask.mgz \n
#-------------------------------------
#@# EM Registration Tue Jun 27 23:12:48 EDT 2017
\n mri_em_register -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mri_em_register.dat -uns 3 -mask brainmask.mgz nu.mgz /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca transforms/talairach.lta \n
#--------------------------------------
#@# CA Normalize Tue Jun 27 23:24:09 EDT 2017
\n mri_ca_normalize -c ctrl_pts.mgz -mask brainmask.mgz nu.mgz /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca transforms/talairach.lta norm.mgz \n
#--------------------------------------
#@# CA Reg Tue Jun 27 23:25:52 EDT 2017
\n mri_ca_register -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mri_ca_register.dat -nobigventricles -T transforms/talairach.lta -align-after -mask brainmask.mgz norm.mgz /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca transforms/talairach.m3z \n
#--------------------------------------
#@# SubCort Seg Wed Jun 28 01:42:08 EDT 2017
\n mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align norm.mgz transforms/talairach.m3z /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca aseg.auto_noCCseg.mgz \n
\n mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/transforms/cc_up.lta sub.01.dh.02 \n
#--------------------------------------
#@# Merge ASeg Wed Jun 28 02:32:54 EDT 2017
\n cp aseg.auto.mgz aseg.presurf.mgz \n
#--------------------------------------------
#@# Intensity Normalization2 Wed Jun 28 02:32:54 EDT 2017
\n mri_normalize -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz \n
#--------------------------------------------
#@# Mask BFS Wed Jun 28 02:35:53 EDT 2017
\n mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz \n
#--------------------------------------------
#@# WM Segmentation Wed Jun 28 02:35:55 EDT 2017
\n mri_segment -mprage brain.mgz wm.seg.mgz \n
\n mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz \n
\n mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz \n
#--------------------------------------------
#@# Fill Wed Jun 28 02:38:04 EDT 2017
\n mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.auto_noCCseg.mgz wm.mgz filled.mgz \n
#--------------------------------------------
#@# Tessellate lh Wed Jun 28 02:38:48 EDT 2017
\n mri_pretess ../mri/filled.mgz 255 ../mri/norm.mgz ../mri/filled-pretess255.mgz \n
\n mri_tessellate ../mri/filled-pretess255.mgz 255 ../surf/lh.orig.nofix \n
\n rm -f ../mri/filled-pretess255.mgz \n
\n mris_extract_main_component ../surf/lh.orig.nofix ../surf/lh.orig.nofix \n
#--------------------------------------------
#@# Tessellate rh Wed Jun 28 02:38:53 EDT 2017
\n mri_pretess ../mri/filled.mgz 127 ../mri/norm.mgz ../mri/filled-pretess127.mgz \n
\n mri_tessellate ../mri/filled-pretess127.mgz 127 ../surf/rh.orig.nofix \n
\n rm -f ../mri/filled-pretess127.mgz \n
\n mris_extract_main_component ../surf/rh.orig.nofix ../surf/rh.orig.nofix \n
#--------------------------------------------
#@# Smooth1 lh Wed Jun 28 02:38:58 EDT 2017
\n mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix \n
#--------------------------------------------
#@# Smooth1 rh Wed Jun 28 02:38:58 EDT 2017
\n mris_smooth -nw -seed 1234 ../surf/rh.orig.nofix ../surf/rh.smoothwm.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:21:36 EDT 2017 
#--------------------------------------------
#@# Smooth1 lh Wed Jun 28 12:21:36 EDT 2017
\n mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:21:46 EDT 2017 
#--------------------------------------------
#@# Smooth1 rh Wed Jun 28 12:21:46 EDT 2017
\n mris_smooth -nw -seed 1234 ../surf/rh.orig.nofix ../surf/rh.smoothwm.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:21:55 EDT 2017 
#--------------------------------------------
#@# Inflation1 lh Wed Jun 28 12:21:56 EDT 2017
\n mris_inflate -no-save-sulc ../surf/lh.smoothwm.nofix ../surf/lh.inflated.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:22:17 EDT 2017 
#--------------------------------------------
#@# Inflation1 rh Wed Jun 28 12:22:17 EDT 2017
\n mris_inflate -no-save-sulc ../surf/rh.smoothwm.nofix ../surf/rh.inflated.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:22:37 EDT 2017 
#--------------------------------------------
#@# QSphere lh Wed Jun 28 12:22:38 EDT 2017
\n mris_sphere -q -seed 1234 ../surf/lh.inflated.nofix ../surf/lh.qsphere.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:24:31 EDT 2017 
#--------------------------------------------
#@# QSphere rh Wed Jun 28 12:24:32 EDT 2017
\n mris_sphere -q -seed 1234 ../surf/rh.inflated.nofix ../surf/rh.qsphere.nofix \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:26:21 EDT 2017 
#--------------------------------------------
#@# Fix Topology Copy lh Wed Jun 28 12:26:22 EDT 2017
\n cp ../surf/lh.orig.nofix ../surf/lh.orig \n
\n cp ../surf/lh.inflated.nofix ../surf/lh.inflated \n
#@# Fix Topology lh Wed Jun 28 12:26:22 EDT 2017
\n mris_fix_topology -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_fix_topology.lh.dat -mgz -sphere qsphere.nofix -ga -seed 1234 sub.01.dh.02 lh \n
\n mris_euler_number ../surf/lh.orig \n
\n mris_remove_intersection ../surf/lh.orig ../surf/lh.orig \n
\n rm ../surf/lh.inflated \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 12:47:28 EDT 2017 
#--------------------------------------------
#@# Fix Topology Copy rh Wed Jun 28 12:47:29 EDT 2017
\n cp ../surf/rh.orig.nofix ../surf/rh.orig \n
\n cp ../surf/rh.inflated.nofix ../surf/rh.inflated \n
#@# Fix Topology rh Wed Jun 28 12:47:29 EDT 2017
\n mris_fix_topology -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_fix_topology.rh.dat -mgz -sphere qsphere.nofix -ga -seed 1234 sub.01.dh.02 rh \n
\n mris_euler_number ../surf/rh.orig \n
\n mris_remove_intersection ../surf/rh.orig ../surf/rh.orig \n
\n rm ../surf/rh.inflated \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 13:04:48 EDT 2017 
#--------------------------------------------
#@# Make White Surf lh Wed Jun 28 13:04:49 EDT 2017
\n mris_make_surfaces -aseg ../mri/aseg.presurf -white white.preaparc -noaparc -mgz -T1 brain.finalsurfs sub.01.dh.02 lh \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 13:19:50 EDT 2017 
#--------------------------------------------
#@# Make White Surf rh Wed Jun 28 13:19:51 EDT 2017
\n mris_make_surfaces -aseg ../mri/aseg.presurf -white white.preaparc -noaparc -mgz -T1 brain.finalsurfs sub.01.dh.02 rh \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 13:34:32 EDT 2017 
#--------------------------------------------
#@# Smooth2 lh Wed Jun 28 13:34:33 EDT 2017
\n mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 13:34:43 EDT 2017 
#--------------------------------------------
#@# Inflation2 lh Wed Jun 28 13:34:44 EDT 2017
\n mris_inflate -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_inflate.lh.dat ../surf/lh.smoothwm ../surf/lh.inflated \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 13:35:02 EDT 2017 
#--------------------------------------------
#@# Sphere lh Wed Jun 28 13:35:03 EDT 2017
\n mris_sphere -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_sphere.lh.dat -seed 1234 ../surf/lh.inflated ../surf/lh.sphere \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 13:47:45 EDT 2017 
#--------------------------------------------
#@# Surf Reg lh Wed Jun 28 13:47:46 EDT 2017
\n mris_register -curv -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_register.lh.dat ../surf/lh.sphere /Volumes/CFMI-CFS/opt/fs6/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/lh.sphere.reg \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:17:23 EDT 2017 
#-----------------------------------------
#@# Cortical Parc lh Wed Jun 28 14:17:25 EDT 2017
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub.01.dh.02 lh ../surf/lh.sphere.reg /Volumes/CFMI-CFS/opt/fs6/average/lh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.annot \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:17:49 EDT 2017 
#--------------------------------------------
#@# Make Pial Surf lh Wed Jun 28 14:17:52 EDT 2017
\n mris_make_surfaces -orig_white white.preaparc -orig_pial white.preaparc -aseg ../mri/aseg.presurf -mgz -T1 brain.finalsurfs sub.01.dh.02 lh \n
#--------------------------------------------
#@# Surf Volume lh Wed Jun 28 14:33:42 EDT 2017
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:33:49 EDT 2017 
#--------------------------------------------
#@# Surf Volume lh Wed Jun 28 14:33:50 EDT 2017
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:33:56 EDT 2017 
#--------------------------------------------
#@# Smooth2 rh Wed Jun 28 14:33:57 EDT 2017
\n mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:34:08 EDT 2017 
#--------------------------------------------
#@# Inflation2 rh Wed Jun 28 14:34:09 EDT 2017
\n mris_inflate -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_inflate.rh.dat ../surf/rh.smoothwm ../surf/rh.inflated \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:34:31 EDT 2017 
#--------------------------------------------
#@# Sphere rh Wed Jun 28 14:34:32 EDT 2017
\n mris_sphere -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_sphere.rh.dat -seed 1234 ../surf/rh.inflated ../surf/rh.sphere \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 14:44:29 EDT 2017 
#--------------------------------------------
#@# Surf Reg rh Wed Jun 28 14:44:30 EDT 2017
\n mris_register -curv -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/touch/rusage.mris_register.rh.dat ../surf/rh.sphere /Volumes/CFMI-CFS/opt/fs6/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/rh.sphere.reg \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:10:59 EDT 2017 
#-----------------------------------------
#@# Cortical Parc rh Wed Jun 28 15:11:00 EDT 2017
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub.01.dh.02 rh ../surf/rh.sphere.reg /Volumes/CFMI-CFS/opt/fs6/average/rh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.annot \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:11:15 EDT 2017 
#--------------------------------------------
#@# Make Pial Surf rh Wed Jun 28 15:11:16 EDT 2017
\n mris_make_surfaces -orig_white white.preaparc -orig_pial white.preaparc -aseg ../mri/aseg.presurf -mgz -T1 brain.finalsurfs sub.01.dh.02 rh \n
#--------------------------------------------
#@# Surf Volume rh Wed Jun 28 15:26:43 EDT 2017
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:26:48 EDT 2017 
#--------------------------------------------
#@# Surf Volume rh Wed Jun 28 15:26:48 EDT 2017
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:26:52 EDT 2017 
#--------------------------------------------
#@# Curv .H and .K lh Wed Jun 28 15:26:53 EDT 2017
\n mris_curvature -w lh.white.preaparc \n
\n mris_curvature -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:28:04 EDT 2017 
#--------------------------------------------
#@# Curv .H and .K rh Wed Jun 28 15:28:05 EDT 2017
\n mris_curvature -w rh.white.preaparc \n
\n mris_curvature -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:29:20 EDT 2017 
\n#-----------------------------------------
#@# Curvature Stats lh Wed Jun 28 15:29:22 EDT 2017
\n mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/lh.curv.stats -F smoothwm sub.01.dh.02 lh curv sulc \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:29:37 EDT 2017 
\n#-----------------------------------------
#@# Curvature Stats rh Wed Jun 28 15:29:41 EDT 2017
\n mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/rh.curv.stats -F smoothwm sub.01.dh.02 rh curv sulc \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:29:56 EDT 2017 
#--------------------------------------------
#@# Jacobian white lh Wed Jun 28 15:29:58 EDT 2017
\n mris_jacobian ../surf/lh.white.preaparc ../surf/lh.sphere.reg ../surf/lh.jacobian_white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:30:10 EDT 2017 
#--------------------------------------------
#@# Jacobian white rh Wed Jun 28 15:30:12 EDT 2017
\n mris_jacobian ../surf/rh.white.preaparc ../surf/rh.sphere.reg ../surf/rh.jacobian_white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:30:23 EDT 2017 
#--------------------------------------------
#@# AvgCurv lh Wed Jun 28 15:30:26 EDT 2017
\n mrisp_paint -a 5 /Volumes/CFMI-CFS/opt/fs6/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/lh.sphere.reg ../surf/lh.avg_curv \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:30:37 EDT 2017 
#--------------------------------------------
#@# AvgCurv rh Wed Jun 28 15:30:40 EDT 2017
\n mrisp_paint -a 5 /Volumes/CFMI-CFS/opt/fs6/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/rh.sphere.reg ../surf/rh.avg_curv \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:30:48 EDT 2017 
#--------------------------------------------
#@# Cortical ribbon mask Wed Jun 28 15:30:50 EDT 2017
\n mris_volmask --aseg_name aseg.presurf --label_left_white 2 --label_left_ribbon 3 --label_right_white 41 --label_right_ribbon 42 --save_ribbon sub.01.dh.02 \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:44:10 EDT 2017 
#-----------------------------------------
#@# Parcellation Stats lh Wed Jun 28 15:44:11 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02 lh white \n
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.pial.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02 lh pial \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:45:22 EDT 2017 
#-----------------------------------------
#@# Parcellation Stats rh Wed Jun 28 15:45:22 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02 rh white \n
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.pial.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02 rh pial \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:46:30 EDT 2017 
#-----------------------------------------
#@# Cortical Parc 2 lh Wed Jun 28 15:46:31 EDT 2017
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub.01.dh.02 lh ../surf/lh.sphere.reg /Volumes/CFMI-CFS/opt/fs6/average/lh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.a2009s.annot \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:46:52 EDT 2017 
#-----------------------------------------
#@# Cortical Parc 2 rh Wed Jun 28 15:46:52 EDT 2017
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub.01.dh.02 rh ../surf/rh.sphere.reg /Volumes/CFMI-CFS/opt/fs6/average/rh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.a2009s.annot \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:47:13 EDT 2017 
#-----------------------------------------
#@# Parcellation Stats 2 lh Wed Jun 28 15:47:13 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.a2009s.stats -b -a ../label/lh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub.01.dh.02 lh white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:47:49 EDT 2017 
#-----------------------------------------
#@# Parcellation Stats 2 rh Wed Jun 28 15:47:50 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.a2009s.stats -b -a ../label/rh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub.01.dh.02 rh white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:48:25 EDT 2017 
#-----------------------------------------
#@# Cortical Parc 3 lh Wed Jun 28 15:48:26 EDT 2017
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub.01.dh.02 lh ../surf/lh.sphere.reg /Volumes/CFMI-CFS/opt/fs6/average/lh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.DKTatlas.annot \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:48:42 EDT 2017 
#-----------------------------------------
#@# Cortical Parc 3 rh Wed Jun 28 15:48:42 EDT 2017
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub.01.dh.02 rh ../surf/rh.sphere.reg /Volumes/CFMI-CFS/opt/fs6/average/rh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.DKTatlas.annot \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:48:59 EDT 2017 
#-----------------------------------------
#@# Parcellation Stats 3 lh Wed Jun 28 15:49:00 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.DKTatlas.stats -b -a ../label/lh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub.01.dh.02 lh white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:49:35 EDT 2017 
#-----------------------------------------
#@# Parcellation Stats 3 rh Wed Jun 28 15:49:35 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.DKTatlas.stats -b -a ../label/rh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub.01.dh.02 rh white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:50:10 EDT 2017 
#-----------------------------------------
#@# WM/GM Contrast lh Wed Jun 28 15:50:11 EDT 2017
\n pctsurfcon --s sub.01.dh.02 --lh-only \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:50:19 EDT 2017 
#-----------------------------------------
#@# WM/GM Contrast rh Wed Jun 28 15:50:19 EDT 2017
\n pctsurfcon --s sub.01.dh.02 --rh-only \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:50:27 EDT 2017 
#-----------------------------------------
#@# Relabel Hypointensities Wed Jun 28 15:50:27 EDT 2017
\n mri_relabel_hypointensities aseg.presurf.mgz ../surf aseg.presurf.hypos.mgz \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 15:50:51 EDT 2017 
#-----------------------------------------
#@# AParc-to-ASeg aparc Wed Jun 28 15:50:51 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02 --volmask --aseg aseg.presurf.hypos --relabel mri/norm.mgz mri/transforms/talairach.m3z /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca mri/aseg.auto_noCCseg.label_intensities.txt \n
#-----------------------------------------
#@# AParc-to-ASeg a2009s Wed Jun 28 15:55:25 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02 --volmask --aseg aseg.presurf.hypos --relabel mri/norm.mgz mri/transforms/talairach.m3z /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca mri/aseg.auto_noCCseg.label_intensities.txt --a2009s \n
#-----------------------------------------
#@# AParc-to-ASeg DKTatlas Wed Jun 28 15:59:58 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02 --volmask --aseg aseg.presurf.hypos --relabel mri/norm.mgz mri/transforms/talairach.m3z /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca mri/aseg.auto_noCCseg.label_intensities.txt --annot aparc.DKTatlas --o mri/aparc.DKTatlas+aseg.mgz \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 16:04:36 EDT 2017 
#-----------------------------------------
#@# APas-to-ASeg Wed Jun 28 16:04:37 EDT 2017
\n apas2aseg --i aparc+aseg.mgz --o aseg.mgz \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 16:04:46 EDT 2017 
#--------------------------------------------
#@# ASeg Stats Wed Jun 28 16:04:46 EDT 2017
\n mri_segstats --seg mri/aseg.mgz --sum stats/aseg.stats --pv mri/norm.mgz --empty --brainmask mri/brainmask.mgz --brain-vol-from-seg --excludeid 0 --excl-ctxgmwm --supratent --subcortgray --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --etiv --surf-wm-vol --surf-ctx-vol --totalgray --euler --ctab /Volumes/CFMI-CFS/opt/fs6/ASegStatsLUT.txt --subject sub.01.dh.02 \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 16:06:05 EDT 2017 
#-----------------------------------------
#@# WMParc Wed Jun 28 16:06:06 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02 --labelwm --hypo-as-wm --rip-unknown --volmask --o mri/wmparc.mgz --ctxseg aparc+aseg.mgz \n
\n mri_segstats --seg mri/wmparc.mgz --sum stats/wmparc.stats --pv mri/norm.mgz --excludeid 0 --brainmask mri/brainmask.mgz --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --subject sub.01.dh.02 --surf-wm-vol --ctab /Volumes/CFMI-CFS/opt/fs6/WMParcStatsLUT.txt --etiv \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 16:12:42 EDT 2017 
#--------------------------------------------
#@# BA_exvivo Labels lh Wed Jun 28 16:12:43 EDT 2017
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA1_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA1_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA2_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA2_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3a_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA3a_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3b_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA3b_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4a_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA4a_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4p_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA4p_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA6_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA6_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA44_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA44_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA45_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA45_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V1_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.V1_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V2_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.V2_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.MT_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.MT_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.entorhinal_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.entorhinal_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.perirhinal_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./lh.perirhinal_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA1_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA1_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA2_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA2_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3a_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA3a_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3b_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA3b_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4a_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA4a_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4p_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA4p_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA6_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA6_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA44_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA44_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA45_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.BA45_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V1_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.V1_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V2_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.V2_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.MT_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.MT_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.entorhinal_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.entorhinal_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.perirhinal_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./lh.perirhinal_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mris_label2annot --s sub.01.dh.02 --hemi lh --ctab /Volumes/CFMI-CFS/opt/fs6/average/colortable_BA.txt --l lh.BA1_exvivo.label --l lh.BA2_exvivo.label --l lh.BA3a_exvivo.label --l lh.BA3b_exvivo.label --l lh.BA4a_exvivo.label --l lh.BA4p_exvivo.label --l lh.BA6_exvivo.label --l lh.BA44_exvivo.label --l lh.BA45_exvivo.label --l lh.V1_exvivo.label --l lh.V2_exvivo.label --l lh.MT_exvivo.label --l lh.entorhinal_exvivo.label --l lh.perirhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose \n
\n mris_label2annot --s sub.01.dh.02 --hemi lh --ctab /Volumes/CFMI-CFS/opt/fs6/average/colortable_BA.txt --l lh.BA1_exvivo.thresh.label --l lh.BA2_exvivo.thresh.label --l lh.BA3a_exvivo.thresh.label --l lh.BA3b_exvivo.thresh.label --l lh.BA4a_exvivo.thresh.label --l lh.BA4p_exvivo.thresh.label --l lh.BA6_exvivo.thresh.label --l lh.BA44_exvivo.thresh.label --l lh.BA45_exvivo.thresh.label --l lh.V1_exvivo.thresh.label --l lh.V2_exvivo.thresh.label --l lh.MT_exvivo.thresh.label --l lh.entorhinal_exvivo.thresh.label --l lh.perirhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.stats -b -a ./lh.BA_exvivo.annot -c ./BA_exvivo.ctab sub.01.dh.02 lh white \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.thresh.stats -b -a ./lh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub.01.dh.02 lh white \n
\n\n#---------------------------------
# New invocation of recon-all Wed Jun 28 16:17:29 EDT 2017 
#--------------------------------------------
#@# BA_exvivo Labels rh Wed Jun 28 16:17:29 EDT 2017
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA1_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA1_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA2_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA2_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3a_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA3a_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3b_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA3b_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4a_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA4a_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4p_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA4p_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA6_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA6_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA44_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA44_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA45_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA45_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V1_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.V1_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V2_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.V2_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.MT_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.MT_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.entorhinal_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.entorhinal_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.perirhinal_exvivo.label --trgsubject sub.01.dh.02 --trglabel ./rh.perirhinal_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA1_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA1_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA2_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA2_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3a_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA3a_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3b_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA3b_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4a_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA4a_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4p_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA4p_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA6_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA6_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA44_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA44_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA45_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.BA45_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V1_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.V1_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V2_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.V2_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.MT_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.MT_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.entorhinal_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.entorhinal_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.perirhinal_exvivo.thresh.label --trgsubject sub.01.dh.02 --trglabel ./rh.perirhinal_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mris_label2annot --s sub.01.dh.02 --hemi rh --ctab /Volumes/CFMI-CFS/opt/fs6/average/colortable_BA.txt --l rh.BA1_exvivo.label --l rh.BA2_exvivo.label --l rh.BA3a_exvivo.label --l rh.BA3b_exvivo.label --l rh.BA4a_exvivo.label --l rh.BA4p_exvivo.label --l rh.BA6_exvivo.label --l rh.BA44_exvivo.label --l rh.BA45_exvivo.label --l rh.V1_exvivo.label --l rh.V2_exvivo.label --l rh.MT_exvivo.label --l rh.entorhinal_exvivo.label --l rh.perirhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose \n
\n mris_label2annot --s sub.01.dh.02 --hemi rh --ctab /Volumes/CFMI-CFS/opt/fs6/average/colortable_BA.txt --l rh.BA1_exvivo.thresh.label --l rh.BA2_exvivo.thresh.label --l rh.BA3a_exvivo.thresh.label --l rh.BA3b_exvivo.thresh.label --l rh.BA4a_exvivo.thresh.label --l rh.BA4p_exvivo.thresh.label --l rh.BA6_exvivo.thresh.label --l rh.BA44_exvivo.thresh.label --l rh.BA45_exvivo.thresh.label --l rh.V1_exvivo.thresh.label --l rh.V2_exvivo.thresh.label --l rh.MT_exvivo.thresh.label --l rh.entorhinal_exvivo.thresh.label --l rh.perirhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.stats -b -a ./rh.BA_exvivo.annot -c ./BA_exvivo.ctab sub.01.dh.02 rh white \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.thresh.stats -b -a ./rh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub.01.dh.02 rh white \n
