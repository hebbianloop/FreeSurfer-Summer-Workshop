\n\n#---------------------------------
# New invocation of recon-all Thu Jun 29 09:52:04 EDT 2017 
#--------------------------------------------
#@# Longitudinal Base Subject Creation Thu Jun 29 09:52:14 EDT 2017
\n mri_diff --notallow-pix --notallow-geo /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01/mri/rawavg.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/rawavg.mgz \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/norm.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01/mri/norm.mgz --lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/sub.01.bl.01_to_sub.01.base.01.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/sub.01.dh.01_to_sub.01.base.01.lta --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/norm_template.mgz --average 1 --sat 4.685 \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01/mri/orig.mgz --average 1 --ixforms /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/sub.01.bl.01_to_sub.01.base.01.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/sub.01.dh.01_to_sub.01.base.01.lta --noit --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/orig.mgz \n
\n mri_concatenate_lta -invert1 sub.01.bl.01_to_sub.01.base.01.lta identity.nofile sub.01.base.01_to_sub.01.bl.01.lta \n
\n mri_concatenate_lta -invert1 sub.01.dh.01_to_sub.01.base.01.lta identity.nofile sub.01.base.01_to_sub.01.dh.01.lta \n
#--------------------------------------------
#@# MotionCor Thu Jun 29 09:54:11 EDT 2017
\n mri_add_xform_to_header -c /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/talairach.xfm /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Thu Jun 29 09:54:14 EDT 2017
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --n 1 --proto-iters 1000 --distance 50 \n
\n talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm \n
talairach_avi log file is transforms/talairach_avi.log...
\n cp transforms/talairach.auto.xfm transforms/talairach.xfm \n
#--------------------------------------------
#@# Talairach Failure Detection Thu Jun 29 09:56:02 EDT 2017
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
\n awk -f /Volumes/CFMI-CFS/opt/fs6/bin/extract_talairach_avi_QA.awk /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/talairach_avi.log \n
\n tal_QC_AZS /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/talairach_avi.log \n
#--------------------------------------------
#@# Nu Intensity Correction Thu Jun 29 09:56:03 EDT 2017
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 \n
\n mri_add_xform_to_header -c /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Thu Jun 29 09:58:05 EDT 2017
\n mri_normalize -g 1 -mprage -W ctrl_vol.mgz bias_vol.mgz nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Thu Jun 29 10:00:39 EDT 2017
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/brainmask.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01/mri/brainmask.mgz --average 0 --ixforms /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/sub.01.bl.01_to_sub.01.base.01.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/mri/transforms/sub.01.dh.01_to_sub.01.base.01.lta --noit --finalnearest --template brainmask_template.mgz \n
\n mri_mask -keep_mask_deletion_edits T1.mgz brainmask_template.mgz brainmask.auto.mgz \n
\n mri_mask -transfer 255 -keep_mask_deletion_edits brainmask.auto.mgz brainmask_template.mgz brainmask.auto.mgz \n
\n cp brainmask.auto.mgz brainmask.mgz \n
#-------------------------------------
#@# EM Registration Thu Jun 29 10:00:53 EDT 2017
\n mri_em_register -rusage /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.01/touch/rusage.mri_em_register.dat -mask brainmask.mgz norm_template.mgz /Volumes/CFMI-CFS/opt/fs6/average/RB_all_2016-05-10.vc700.gca transforms/talairach.lta \n
