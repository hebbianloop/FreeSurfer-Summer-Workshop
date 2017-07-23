\n\n#---------------------------------
# New invocation of recon-all Sun Jul 23 09:44:18 EDT 2017 
#--------------------------------------------
#@# MotionCor Sun Jul 23 09:44:22 EDT 2017
\n mri_convert -at /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/sub.01.dh.02_to_sub.01.base.03.lta -odt uchar -rt cubic /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig/001.mgz /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/orig.mgz \n
\n mri_convert -at /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/sub.01.dh.02_to_sub.01.base.03.lta -rt cubic /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig/001.mgz /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/rawavg.mgz \n
\n mri_add_xform_to_header -c /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/transforms/talairach.xfm /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/orig.mgz /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Sun Jul 23 09:44:53 EDT 2017
\n cp /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/talairach.xfm /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/transforms/talairach.auto.xfm \n
talairach_avi log file is transforms/talairach_avi.log...
\n cp transforms/talairach.auto.xfm transforms/talairach.xfm \n
#--------------------------------------------
#@# Talairach Failure Detection Sun Jul 23 09:44:55 EDT 2017
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
#--------------------------------------------
#@# Nu Intensity Correction Sun Jul 23 09:44:55 EDT 2017
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 \n
\n mri_add_xform_to_header -c /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Sun Jul 23 09:47:17 EDT 2017
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --n 1 --proto-iters 1000 --distance 200 \n
\n mri_normalize -g 1 -mprage nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Sun Jul 23 09:51:06 EDT 2017
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/brainmask.mgz ./brainmask_sub.01.base.03.mgz \n
\n mri_mask -keep_mask_deletion_edits T1.mgz brainmask_sub.01.base.03.mgz brainmask.auto.mgz \n
\n mri_mask -transfer 255 -keep_mask_deletion_edits brainmask.auto.mgz brainmask_sub.01.base.03.mgz brainmask.auto.mgz \n
\n cp brainmask.auto.mgz brainmask.mgz \n
#-------------------------------------
#@# EM Registration Sun Jul 23 09:51:11 EDT 2017
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/talairach.lta transforms/talairach.lta \n
#--------------------------------------
#@# CA Normalize Sun Jul 23 09:51:11 EDT 2017
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/aseg.mgz aseg_sub.01.base.03.mgz \n
\n mri_ca_normalize -long aseg_sub.01.base.03.mgz -mask brainmask.mgz nu.mgz /Applications/freesurfer//average/RB_all_2016-05-10.vc700.gca transforms/talairach.lta norm.mgz \n
#--------------------------------------
#@# CA Reg Sun Jul 23 09:53:11 EDT 2017
\n mri_ca_register -rusage /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/touch/rusage.mri_ca_register.dat -nobigventricles -levels 2 -A 1 -l /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/talairach.m3z identity.nofile -align-after -mask brainmask.mgz norm.mgz /Applications/freesurfer//average/RB_all_2016-05-10.vc700.gca transforms/talairach.m3z \n
#--------------------------------------
#@# SubCort Seg Sun Jul 23 10:32:43 EDT 2017
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/sub.01.bl.01_to_sub.01.base.03.lta /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/transforms/sub.01.bl.01_to_sub.01.dh.02.long.sub.01.base.03.lta \n
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/sub.01.dh.02_to_sub.01.base.03.lta /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/transforms/sub.01.dh.02_to_sub.01.dh.02.long.sub.01.base.03.lta \n
\n mri_fuse_segmentations -a aseg.presurf.mgz -c aseg.auto_noCCseg.mgz -n norm.mgz sub.01.dh.02.long.sub.01.base.03 sub.01.bl.01 sub.01.dh.02 aseg.fused.mgz \n
\n mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align -r /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/aseg.fused.mgz -ri /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/aseg.auto_noCCseg.label_intensities.txt norm.mgz transforms/talairach.m3z /Applications/freesurfer//average/RB_all_2016-05-10.vc700.gca aseg.auto_noCCseg.mgz \n
\n mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/mri/transforms/cc_up.lta sub.01.dh.02.long.sub.01.base.03 \n
#--------------------------------------
#@# Merge ASeg Sun Jul 23 10:39:42 EDT 2017
\n cp aseg.auto.mgz aseg.presurf.mgz \n
#--------------------------------------------
#@# Intensity Normalization2 Sun Jul 23 10:39:42 EDT 2017
\n mri_normalize -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz \n
#--------------------------------------------
#@# Mask BFS Sun Jul 23 10:43:58 EDT 2017
\n mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz \n
#--------------------------------------------
#@# WM Segmentation Sun Jul 23 10:43:59 EDT 2017
\n mri_segment -mprage brain.mgz wm.seg.mgz \n
\n mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz \n
\n mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz \n
\n mri_mask -transfer 255 -keep_mask_deletion_edits -xform /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/transforms/sub.01.dh.02_to_sub.01.base.03.lta wm.mgz /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/wm.mgz wm.mgz \n
#--------------------------------------------
#@# Fill Sun Jul 23 10:46:50 EDT 2017
\n mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.auto_noCCseg.mgz wm.mgz filled.mgz \n
#--------------------------------------------
#@# Make White Surf lh Sun Jul 23 10:47:45 EDT 2017
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/lh.white /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/lh.orig \n
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/lh.white /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/lh.orig_white \n
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/lh.pial /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/lh.orig_pial \n
\n mris_make_surfaces -orig_white orig_white -orig orig_white -long -max 3.5 -aseg ../mri/aseg.presurf -white white.preaparc -noaparc -whiteonly -mgz -T1 brain.finalsurfs sub.01.dh.02.long.sub.01.base.03 lh \n
#--------------------------------------------
#@# Make White Surf rh Sun Jul 23 10:47:45 EDT 2017
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/rh.white /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/rh.orig \n
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/rh.white /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/rh.orig_white \n
\n cp -vf /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/rh.pial /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/rh.orig_pial \n
\n mris_make_surfaces -orig_white orig_white -orig orig_white -long -max 3.5 -aseg ../mri/aseg.presurf -white white.preaparc -noaparc -whiteonly -mgz -T1 brain.finalsurfs sub.01.dh.02.long.sub.01.base.03 rh \n
#--------------------------------------------
#@# Smooth2 lh Sun Jul 23 10:53:22 EDT 2017
\n mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm \n
#--------------------------------------------
#@# Smooth2 rh Sun Jul 23 10:53:22 EDT 2017
\n mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm \n
#--------------------------------------------
#@# Inflation2 lh Sun Jul 23 10:53:31 EDT 2017
\n mris_inflate -rusage /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/touch/rusage.mris_inflate.lh.dat ../surf/lh.smoothwm ../surf/lh.inflated \n
#--------------------------------------------
#@# Inflation2 rh Sun Jul 23 10:53:31 EDT 2017
\n mris_inflate -rusage /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/touch/rusage.mris_inflate.rh.dat ../surf/rh.smoothwm ../surf/rh.inflated \n
#--------------------------------------------
#@# Curv .H and .K lh Sun Jul 23 10:54:11 EDT 2017
\n mris_curvature -w lh.white.preaparc \n
\n mris_curvature -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated \n
#--------------------------------------------
#@# Curv .H and .K rh Sun Jul 23 10:54:11 EDT 2017
\n mris_curvature -w rh.white.preaparc \n
\n mris_curvature -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated \n
\n#-----------------------------------------
#@# Curvature Stats lh Sun Jul 23 10:55:31 EDT 2017
\n mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/lh.curv.stats -F smoothwm sub.01.dh.02.long.sub.01.base.03 lh curv sulc \n
\n#-----------------------------------------
#@# Curvature Stats rh Sun Jul 23 10:55:37 EDT 2017
\n mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/rh.curv.stats -F smoothwm sub.01.dh.02.long.sub.01.base.03 rh curv sulc \n
#--------------------------------------------
#@# Sphere lh Sun Jul 23 10:55:43 EDT 2017
\n cp /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/lh.sphere /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/lh.sphere \n
#--------------------------------------------
#@# Sphere rh Sun Jul 23 10:55:43 EDT 2017
\n cp /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/rh.sphere /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/surf/rh.sphere \n
#--------------------------------------------
#@# Surf Reg lh Sun Jul 23 10:55:43 EDT 2017
\n mris_register -curv -rusage /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/touch/rusage.mris_register.lh.dat -nosulc -norot /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/lh.sphere.reg /Applications/freesurfer//average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/lh.sphere.reg \n
#--------------------------------------------
#@# Surf Reg rh Sun Jul 23 10:55:43 EDT 2017
\n mris_register -curv -rusage /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02.long.sub.01.base.03/touch/rusage.mris_register.rh.dat -nosulc -norot /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/surf/rh.sphere.reg /Applications/freesurfer//average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/rh.sphere.reg \n
#--------------------------------------------
#@# Jacobian white lh Sun Jul 23 11:15:01 EDT 2017
\n mris_jacobian ../surf/lh.white.preaparc ../surf/lh.sphere.reg ../surf/lh.jacobian_white \n
#--------------------------------------------
#@# Jacobian white rh Sun Jul 23 11:15:01 EDT 2017
\n mris_jacobian ../surf/rh.white.preaparc ../surf/rh.sphere.reg ../surf/rh.jacobian_white \n
#--------------------------------------------
#@# AvgCurv lh Sun Jul 23 11:15:03 EDT 2017
\n mrisp_paint -a 5 /Applications/freesurfer//average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/lh.sphere.reg ../surf/lh.avg_curv \n
#--------------------------------------------
#@# AvgCurv rh Sun Jul 23 11:15:03 EDT 2017
\n mrisp_paint -a 5 /Applications/freesurfer//average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/rh.sphere.reg ../surf/rh.avg_curv \n
#-----------------------------------------
#@# Cortical Parc lh Sun Jul 23 11:15:05 EDT 2017
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/label/lh.aparc.annot sub.01.dh.02.long.sub.01.base.03 lh ../surf/lh.sphere.reg /Applications/freesurfer//average/lh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.annot \n
#-----------------------------------------
#@# Cortical Parc rh Sun Jul 23 11:15:05 EDT 2017
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/label/rh.aparc.annot sub.01.dh.02.long.sub.01.base.03 rh ../surf/rh.sphere.reg /Applications/freesurfer//average/rh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.annot \n
#--------------------------------------------
#@# Make Pial Surf lh Sun Jul 23 11:15:23 EDT 2017
\n mris_make_surfaces -orig orig_white -orig_white orig_white -orig_pial orig_pial -long -max 3.5 -aseg ../mri/aseg.presurf -mgz -T1 brain.finalsurfs sub.01.dh.02.long.sub.01.base.03 lh \n
#--------------------------------------------
#@# Make Pial Surf rh Sun Jul 23 11:15:23 EDT 2017
\n mris_make_surfaces -orig orig_white -orig_white orig_white -orig_pial orig_pial -long -max 3.5 -aseg ../mri/aseg.presurf -mgz -T1 brain.finalsurfs sub.01.dh.02.long.sub.01.base.03 rh \n
#--------------------------------------------
#@# Surf Volume lh Sun Jul 23 11:29:59 EDT 2017
#--------------------------------------------
#@# Surf Volume rh Sun Jul 23 11:30:02 EDT 2017
#--------------------------------------------
#@# Cortical ribbon mask Sun Jul 23 11:30:06 EDT 2017
\n mris_volmask --aseg_name aseg.presurf --label_left_white 2 --label_left_ribbon 3 --label_right_white 41 --label_right_ribbon 42 --save_ribbon sub.01.dh.02.long.sub.01.base.03 \n
#-----------------------------------------
#@# Parcellation Stats lh Sun Jul 23 11:44:28 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02.long.sub.01.base.03 lh white \n
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.pial.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02.long.sub.01.base.03 lh pial \n
#-----------------------------------------
#@# Parcellation Stats rh Sun Jul 23 11:44:28 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02.long.sub.01.base.03 rh white \n
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.pial.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub.01.dh.02.long.sub.01.base.03 rh pial \n
#-----------------------------------------
#@# Cortical Parc 2 lh Sun Jul 23 11:46:16 EDT 2017
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/label/lh.aparc.a2009s.annot sub.01.dh.02.long.sub.01.base.03 lh ../surf/lh.sphere.reg /Applications/freesurfer//average/lh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.a2009s.annot \n
#-----------------------------------------
#@# Cortical Parc 2 rh Sun Jul 23 11:46:16 EDT 2017
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/label/rh.aparc.a2009s.annot sub.01.dh.02.long.sub.01.base.03 rh ../surf/rh.sphere.reg /Applications/freesurfer//average/rh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.a2009s.annot \n
#-----------------------------------------
#@# Parcellation Stats 2 lh Sun Jul 23 11:46:35 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.a2009s.stats -b -a ../label/lh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub.01.dh.02.long.sub.01.base.03 lh white \n
#-----------------------------------------
#@# Parcellation Stats 2 rh Sun Jul 23 11:46:35 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.a2009s.stats -b -a ../label/rh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub.01.dh.02.long.sub.01.base.03 rh white \n
#-----------------------------------------
#@# Cortical Parc 3 lh Sun Jul 23 11:47:34 EDT 2017
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/label/lh.aparc.DKTatlas.annot sub.01.dh.02.long.sub.01.base.03 lh ../surf/lh.sphere.reg /Applications/freesurfer//average/lh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.DKTatlas.annot \n
#-----------------------------------------
#@# Cortical Parc 3 rh Sun Jul 23 11:47:34 EDT 2017
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/label/rh.aparc.DKTatlas.annot sub.01.dh.02.long.sub.01.base.03 rh ../surf/rh.sphere.reg /Applications/freesurfer//average/rh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.DKTatlas.annot \n
#-----------------------------------------
#@# Parcellation Stats 3 lh Sun Jul 23 11:47:51 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.DKTatlas.stats -b -a ../label/lh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub.01.dh.02.long.sub.01.base.03 lh white \n
#-----------------------------------------
#@# Parcellation Stats 3 rh Sun Jul 23 11:47:51 EDT 2017
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.DKTatlas.stats -b -a ../label/rh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub.01.dh.02.long.sub.01.base.03 rh white \n
#-----------------------------------------
#@# WM/GM Contrast lh Sun Jul 23 11:48:48 EDT 2017
\n pctsurfcon --s sub.01.dh.02.long.sub.01.base.03 --lh-only \n
#-----------------------------------------
#@# WM/GM Contrast rh Sun Jul 23 11:48:48 EDT 2017
\n pctsurfcon --s sub.01.dh.02.long.sub.01.base.03 --rh-only \n
#-----------------------------------------
#@# Relabel Hypointensities Sun Jul 23 11:48:57 EDT 2017
\n mri_relabel_hypointensities aseg.presurf.mgz ../surf aseg.presurf.hypos.mgz \n
#-----------------------------------------
#@# AParc-to-ASeg aparc Sun Jul 23 11:49:21 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02.long.sub.01.base.03 --volmask --aseg aseg.presurf.hypos --relabel mri/norm.mgz mri/transforms/talairach.m3z /Applications/freesurfer//average/RB_all_2016-05-10.vc700.gca /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/aseg.auto_noCCseg.label_intensities.txt \n
#-----------------------------------------
#@# AParc-to-ASeg a2009s Sun Jul 23 11:49:21 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02.long.sub.01.base.03 --volmask --aseg aseg.presurf.hypos --relabel mri/norm.mgz mri/transforms/talairach.m3z /Applications/freesurfer//average/RB_all_2016-05-10.vc700.gca /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/aseg.auto_noCCseg.label_intensities.txt --a2009s \n
#-----------------------------------------
#@# AParc-to-ASeg DKTatlas Sun Jul 23 11:49:21 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02.long.sub.01.base.03 --volmask --aseg aseg.presurf.hypos --relabel mri/norm.mgz mri/transforms/talairach.m3z /Applications/freesurfer//average/RB_all_2016-05-10.vc700.gca /Users/seldamat/FreeSurfer-Summer-Workshop/fs/sub.01.base.03/mri/aseg.auto_noCCseg.label_intensities.txt --annot aparc.DKTatlas --o mri/aparc.DKTatlas+aseg.mgz \n
#-----------------------------------------
#@# APas-to-ASeg Sun Jul 23 11:59:45 EDT 2017
\n apas2aseg --i aparc+aseg.mgz --o aseg.mgz \n
#--------------------------------------------
#@# ASeg Stats Sun Jul 23 11:59:52 EDT 2017
\n mri_segstats --seg mri/aseg.mgz --sum stats/aseg.stats --pv mri/norm.mgz --empty --brainmask mri/brainmask.mgz --brain-vol-from-seg --excludeid 0 --excl-ctxgmwm --supratent --subcortgray --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --etiv --surf-wm-vol --surf-ctx-vol --totalgray --ctab /Applications/freesurfer//ASegStatsLUT.txt --subject sub.01.dh.02.long.sub.01.base.03 \n
#-----------------------------------------
#@# WMParc Sun Jul 23 12:01:45 EDT 2017
\n mri_aparc2aseg --s sub.01.dh.02.long.sub.01.base.03 --labelwm --hypo-as-wm --rip-unknown --volmask --o mri/wmparc.mgz --ctxseg aparc+aseg.mgz \n
\n mri_segstats --seg mri/wmparc.mgz --sum stats/wmparc.stats --pv mri/norm.mgz --excludeid 0 --brainmask mri/brainmask.mgz --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --subject sub.01.dh.02.long.sub.01.base.03 --surf-wm-vol --ctab /Applications/freesurfer//WMParcStatsLUT.txt --etiv \n
#--------------------------------------------
#@# BA_exvivo Labels lh Sun Jul 23 12:09:39 EDT 2017
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA1_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA1_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA2_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA2_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3a_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA3a_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3b_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA3b_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4a_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA4a_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4p_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA4p_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA6_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA6_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA44_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA44_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA45_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA45_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V1_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.V1_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V2_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.V2_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.MT_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.MT_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.entorhinal_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.entorhinal_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.perirhinal_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.perirhinal_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA1_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA1_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA2_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA2_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3a_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA3a_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA3b_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA3b_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4a_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA4a_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA4p_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA4p_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA6_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA6_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA44_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA44_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.BA45_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.BA45_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V1_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.V1_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.V2_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.V2_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.MT_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.MT_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.entorhinal_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.entorhinal_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/lh.perirhinal_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./lh.perirhinal_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mris_label2annot --s sub.01.dh.02.long.sub.01.base.03 --hemi lh --ctab /Applications/freesurfer//average/colortable_BA.txt --l lh.BA1_exvivo.label --l lh.BA2_exvivo.label --l lh.BA3a_exvivo.label --l lh.BA3b_exvivo.label --l lh.BA4a_exvivo.label --l lh.BA4p_exvivo.label --l lh.BA6_exvivo.label --l lh.BA44_exvivo.label --l lh.BA45_exvivo.label --l lh.V1_exvivo.label --l lh.V2_exvivo.label --l lh.MT_exvivo.label --l lh.entorhinal_exvivo.label --l lh.perirhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose \n
\n mris_label2annot --s sub.01.dh.02.long.sub.01.base.03 --hemi lh --ctab /Applications/freesurfer//average/colortable_BA.txt --l lh.BA1_exvivo.thresh.label --l lh.BA2_exvivo.thresh.label --l lh.BA3a_exvivo.thresh.label --l lh.BA3b_exvivo.thresh.label --l lh.BA4a_exvivo.thresh.label --l lh.BA4p_exvivo.thresh.label --l lh.BA6_exvivo.thresh.label --l lh.BA44_exvivo.thresh.label --l lh.BA45_exvivo.thresh.label --l lh.V1_exvivo.thresh.label --l lh.V2_exvivo.thresh.label --l lh.MT_exvivo.thresh.label --l lh.entorhinal_exvivo.thresh.label --l lh.perirhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.stats -b -a ./lh.BA_exvivo.annot -c ./BA_exvivo.ctab sub.01.dh.02.long.sub.01.base.03 lh white \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.thresh.stats -b -a ./lh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub.01.dh.02.long.sub.01.base.03 lh white \n
#--------------------------------------------
#@# BA_exvivo Labels rh Sun Jul 23 12:13:02 EDT 2017
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA1_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA1_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA2_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA2_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3a_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA3a_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3b_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA3b_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4a_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA4a_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4p_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA4p_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA6_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA6_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA44_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA44_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA45_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA45_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V1_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.V1_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V2_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.V2_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.MT_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.MT_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.entorhinal_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.entorhinal_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.perirhinal_exvivo.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.perirhinal_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA1_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA1_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA2_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA2_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3a_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA3a_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA3b_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA3b_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4a_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA4a_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA4p_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA4p_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA6_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA6_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA44_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA44_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.BA45_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.BA45_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V1_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.V1_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.V2_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.V2_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.MT_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.MT_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.entorhinal_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.entorhinal_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Users/seldamat/FreeSurfer-Summer-Workshop/fs/fsaverage/label/rh.perirhinal_exvivo.thresh.label --trgsubject sub.01.dh.02.long.sub.01.base.03 --trglabel ./rh.perirhinal_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mris_label2annot --s sub.01.dh.02.long.sub.01.base.03 --hemi rh --ctab /Applications/freesurfer//average/colortable_BA.txt --l rh.BA1_exvivo.label --l rh.BA2_exvivo.label --l rh.BA3a_exvivo.label --l rh.BA3b_exvivo.label --l rh.BA4a_exvivo.label --l rh.BA4p_exvivo.label --l rh.BA6_exvivo.label --l rh.BA44_exvivo.label --l rh.BA45_exvivo.label --l rh.V1_exvivo.label --l rh.V2_exvivo.label --l rh.MT_exvivo.label --l rh.entorhinal_exvivo.label --l rh.perirhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose \n
\n mris_label2annot --s sub.01.dh.02.long.sub.01.base.03 --hemi rh --ctab /Applications/freesurfer//average/colortable_BA.txt --l rh.BA1_exvivo.thresh.label --l rh.BA2_exvivo.thresh.label --l rh.BA3a_exvivo.thresh.label --l rh.BA3b_exvivo.thresh.label --l rh.BA4a_exvivo.thresh.label --l rh.BA4p_exvivo.thresh.label --l rh.BA6_exvivo.thresh.label --l rh.BA44_exvivo.thresh.label --l rh.BA45_exvivo.thresh.label --l rh.V1_exvivo.thresh.label --l rh.V2_exvivo.thresh.label --l rh.MT_exvivo.thresh.label --l rh.entorhinal_exvivo.thresh.label --l rh.perirhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.stats -b -a ./rh.BA_exvivo.annot -c ./BA_exvivo.ctab sub.01.dh.02.long.sub.01.base.03 rh white \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.thresh.stats -b -a ./rh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub.01.dh.02.long.sub.01.base.03 rh white \n
\n\n#---------------------------------
# New invocation of recon-all Sun Jul 23 13:30:22 EDT 2017 
#--------------------------------------------
#@# Qdec Cache preproc lh thickness fsaverage Sun Jul 23 13:30:24 EDT 2017
\n mris_preproc --s sub.01.dh.02.long.sub.01.base.03 --hemi lh --meas thickness --target fsaverage --out lh.thickness.fsaverage.mgh \n
#--------------------------------------------
#@# Qdec Cache preproc rh thickness fsaverage Sun Jul 23 13:30:30 EDT 2017
\n mris_preproc --s sub.01.dh.02.long.sub.01.base.03 --hemi rh --meas thickness --target fsaverage --out rh.thickness.fsaverage.mgh \n
#--------------------------------------------
#@# Qdec Cache surf2surf lh thickness fwhm7 fsaverage Sun Jul 23 13:30:36 EDT 2017
\n mri_surf2surf --prune --s fsaverage --hemi lh --fwhm 7 --sval lh.thickness.fsaverage.mgh --tval lh.thickness.fwhm7.fsaverage.mgh --cortex \n
#--------------------------------------------
#@# Qdec Cache surf2surf rh thickness fwhm7 fsaverage Sun Jul 23 13:30:42 EDT 2017
\n mri_surf2surf --prune --s fsaverage --hemi rh --fwhm 7 --sval rh.thickness.fsaverage.mgh --tval rh.thickness.fwhm7.fsaverage.mgh --cortex \n
