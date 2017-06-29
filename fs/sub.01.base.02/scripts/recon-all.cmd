\n\n#---------------------------------
# New invocation of recon-all Thu Jun 29 10:04:54 EDT 2017 
#--------------------------------------------
#@# Longitudinal Base Subject Creation Thu Jun 29 10:04:58 EDT 2017
\n mri_diff --notallow-pix --notallow-geo /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/rawavg.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.02/mri/rawavg.mgz \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.02/mri/norm.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/norm.mgz --lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/sub.01.bl.02_to_sub.01.base.02.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/sub.01.dh.02_to_sub.01.base.02.lta --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/norm_template.mgz --average 1 --sat 4.685 \n
\n\n#---------------------------------
# New invocation of recon-all Thu Jun 29 10:05:39 EDT 2017 
\n\n#---------------------------------
# New invocation of recon-all Thu Jun 29 10:07:33 EDT 2017 
#--------------------------------------------
#@# Longitudinal Base Subject Creation Thu Jun 29 10:07:38 EDT 2017
\n mri_diff --notallow-pix --notallow-geo /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/rawavg.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.02/mri/rawavg.mgz \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.02/mri/norm.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/norm.mgz --lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/sub.01.bl.02_to_sub.01.base.02.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/sub.01.dh.02_to_sub.01.base.02.lta --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/norm_template.mgz --average 1 --sat 4.685 \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.02/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.02/mri/orig.mgz --average 1 --ixforms /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/sub.01.bl.02_to_sub.01.base.02.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/sub.01.dh.02_to_sub.01.base.02.lta --noit --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/orig.mgz \n
\n mri_concatenate_lta -invert1 sub.01.bl.02_to_sub.01.base.02.lta identity.nofile sub.01.base.02_to_sub.01.bl.02.lta \n
\n mri_concatenate_lta -invert1 sub.01.dh.02_to_sub.01.base.02.lta identity.nofile sub.01.base.02_to_sub.01.dh.02.lta \n
#--------------------------------------------
#@# MotionCor Thu Jun 29 10:09:14 EDT 2017
\n mri_add_xform_to_header -c /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/transforms/talairach.xfm /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.base.02/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Thu Jun 29 10:09:16 EDT 2017
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --n 1 --proto-iters 1000 --distance 50 \n
