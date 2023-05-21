---
title: "Siamese Masked Autoencoders"
author_list: <span class="nowrap"> Agrim Gupta<sup>1</sup>, </span> <span class="nowrap"> Jiajun Wu<sup>1</sup>, </span> <span class="nowrap"> Jia Deng<sup>2</sup> </span>, <span class="nowrap"> Li Fei-Fei<sup>1</sup> </span>
affiliations: <sup>1</sup> Stanford University, <sup>2</sup> Princeton University
mathjax: true
---
![SiamMAE model diagram](resources/model.png)


## Abstract

Establishing correspondence between images or scenes is a significant challenge in computer vision, especially given occlusions, viewpoint changes, and varying object appearances. In this paper, we present Siamese Masked Autoencoders (SiamMAE), a simple extension of Masked Autoencoders (MAE) for learning visual correspondence from videos. SiamMAE operates on pairs of randomly sampled video frames and *asymmetrically* masks them. These frames are processed *independently* by an encoder network, and a decoder composed of a sequence of cross-attention layers is tasked with predicting the missing patches in the future frame. By masking a large fraction (95%) of patches in the future frame while leaving the past frame unchanged, SiamMAE encourages the network to focus on object motion and learn object-centric representations. Despite its conceptual simplicity, features learned via SiamMAE outperform state-of-the-art self-supervised methods on video object segmentation, pose keypoint propagation, and semantic part propagation tasks. SiamMAE achieves competitive results without relying on data augmentation, handcrafted tracking-based pretext tasks, or other techniques to prevent representational collapse.

---

## Qualitative results

### Attention Map Visualization


We visualize the self-attention map of the ViT-S/8 model. We use the [CLS] token as the query and visualize the attention of a subset of heads from the last layer for 720p videos from internet and DAVIS dataset. In addition, we also show attention of a single head from the last layer with 720p images from ImageNet. We find that the model attends to the object boundaries. Unlike contrastive methods, there is no explicit loss function acting on the [CLS] token. These self-attention maps suggest that the model has learned the notion of object boundaries from object motion in videos.

#### Internet Videos

<div style="text-align: center">
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/wild/dog_black_short.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/wild/dog_black_short.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>	
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/wild/dog_golden_short.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/wild/dog_golden_short.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>	
</div>


#### DAVIS Videos

<div style="text-align: center">
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/attn/breakdance-flare.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/attn/breakdance-flare.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>	
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/attn/pigs.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/attn/pigs.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/attn/koala.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/attn/koala.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/attn/snowboard.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/attn/snowboard.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
</div>

#### ImageNet Images

<div style="text-align: center">
	<img src="resources/attention_map.png" alt="Description of Image">
</div>

---

### DAVIS: Video Object Segmentation 
<div style="text-align: center">
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/davis/blackswan.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/davis/blackswan.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>	
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/davis/breakdance.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/davis/breakdance.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/davis/libby.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/davis/libby.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/davis/horsejump-high.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/davis/horsejump-high.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/davis/lab-coat.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/davis/lab-coat.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/davis/parkour.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/davis/parkour.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
</div>

---
### VIP: Semantic Part Propagation (shown at 5FPS)
<div style="text-align: center">
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/VIP/videos37.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/VIP/videos37.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>	
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/VIP/videos91.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/VIP/videos91.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/VIP/videos151.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/VIP/videos151.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/VIP/videos198.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/VIP/videos198.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/VIP/videos297.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/VIP/videos297.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/VIP/videos361.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/VIP/videos361.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
</div>

### JHMDB: Pose Keypoint Propagation
<div style="text-align: center">
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/jhmdb/1.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/jhmdb/1.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>	
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/jhmdb/2.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/jhmdb/2.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/jhmdb/3.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/jhmdb/3.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/jhmdb/4.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/jhmdb/4.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/jhmdb/5.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/jhmdb/5.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
	<video class="results_video_256" playsinline autoplay muted loop>
		  <source src="resources/jhmdb/6.mp4" type='video/mp4'>
		  <!-- <source src="resources/bair/bair_indiv_0_sfri.mp4" type='video/mp4'> -->
		  <source src="resources/jhmdb/6.webm" type='video/webm'>
		  Your browser does not support the video tag.
	</video>
</div>