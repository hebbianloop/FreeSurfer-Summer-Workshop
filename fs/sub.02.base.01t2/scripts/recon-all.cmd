\n\n#---------------------------------
# New invocation of recon-all Thu Jun 29 10:06:42 EDT 2017 
#--------------------------------------------
#@# Longitudinal Base Subject Creation Thu Jun 29 10:06:47 EDT 2017
\n mri_diff --notallow-pix --notallow-geo /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01t2/mri/rawavg.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/rawavg.mgz \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/norm.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01t2/mri/norm.mgz --lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/transforms/sub.01.bl.01_to_sub.02.base.01t2.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/transforms/sub.01.dh.01t2_to_sub.02.base.01t2.lta --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/norm_template.mgz --average 1 --sat 4.685 \n
\n mri_robust_template --mov /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.bl.01/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.01.dh.01t2/mri/orig.mgz --average 1 --ixforms /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/transforms/sub.01.bl.01_to_sub.02.base.01t2.lta /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/transforms/sub.01.dh.01t2_to_sub.02.base.01t2.lta --noit --template /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/orig.mgz \n
\n mri_concatenate_lta -invert1 sub.01.bl.01_to_sub.02.base.01t2.lta identity.nofile sub.02.base.01t2_to_sub.01.bl.01.lta \n
\n mri_concatenate_lta -invert1 sub.01.dh.01t2_to_sub.02.base.01t2.lta identity.nofile sub.02.base.01t2_to_sub.01.dh.01t2.lta \n
#--------------------------------------------
#@# MotionCor Thu Jun 29 10:08:44 EDT 2017
\n mri_add_xform_to_header -c /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/transforms/talairach.xfm /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/orig.mgz /Volumes/CFMI-CFS/sync/FreeSurfer-Summer-Workshop/fs/sub.02.base.01t2/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Thu Jun 29 10:08:46 EDT 2017
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --n 1 --proto-iters 1000 --distance 50 \n
