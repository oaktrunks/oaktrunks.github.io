GDPC                 �                                                                         T   res://.godot/exported/133200997/export-3a1abee5a719ca68f78c72218e95b515-metal.res   �      H
      u)�D�5�եb�!�%    T   res://.godot/exported/133200997/export-3f031b8c55535d1bbd6124fa0d796622-train.scn   P            �Vi�����s���1Gi    P   res://.godot/exported/133200997/export-6bab30075bec6dca5efb9a8285be1fb5-wood.res)      <
      �����_��6m�\     T   res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn   �A      �      ���G��*���W:f)`�    T   res://.godot/exported/133200997/export-d54ac8696c499bd006a8cd0ae6f1937a-black.res   p      H
      �.��膥{go�B�}    ,   res://.godot/global_script_class_cache.cfg   [             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexP3      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �^      �       �?�fu�ϧ�+^�+       res://CollisionShape3D.gd    A      �       f���r<�	��'�r�I       res://assets/MouseRay.gd        �       =U��>-`�` �٧��       res://assets/train.gd   �       �      9�l��0C�+j�#G        res://assets/train.tscn.remap   �X      b       ���	ze��D���       res://icon.svg   [      �      C��=U���^Qu��U3       res://icon.svg.import   0@      �       �f��U*�N���A�k        res://materials/black.tres.remap@Y      b       ͎���������        res://materials/metal.tres.remap�Y      b       ,�r�&t��bE�`�"D        res://materials/wood.tres.remap  Z      a       }+����_�S��#�       res://project.binary�_      �      J�;�l�
d�c�����       res://scene.tscn.remap  �Z      b       ��w$yWJMX��    }T��԰�extends RayCast3D

@onready var 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
^��x"extends CharacterBody3D


@onready var camera = $Camera3D
@onready var train = $Train
@onready var speed = 10
@onready var rotation_clamp = 1.5

const ANGLE_DEADZONE = 0.5
const SPRINT_MULTIPLIER = 2

func _input(event):
	if event.is_action_pressed("Sprint"):
		speed = speed * SPRINT_MULTIPLIER
		rotation_clamp = rotation_clamp * SPRINT_MULTIPLIER
	if event.is_action_released("Sprint"):
		speed = speed / SPRINT_MULTIPLIER
		rotation_clamp = rotation_clamp / SPRINT_MULTIPLIER

func _physics_process(delta):
	var train_forward_vector = train.transform.basis * Vector3.RIGHT
	physics_rotate(delta, train_forward_vector)
	physics_move(delta, train_forward_vector)
	
func physics_rotate(delta, train_forward_vector):
	var relative_mouse_pos = get_relative_mouse_position()
	if abs(relative_mouse_pos.x) > ANGLE_DEADZONE or abs(relative_mouse_pos.y) > ANGLE_DEADZONE:
		var angle = Vector2(train_forward_vector.x, train_forward_vector.z).angle_to(Vector2(relative_mouse_pos.x, relative_mouse_pos.z))
		train.rotate_y(-clamp(angle, -rotation_clamp * delta, rotation_clamp * delta))

func physics_move(delta, train_forward_vector):
	var movement = train_forward_vector * speed
	velocity.x = movement.x
	velocity.z = movement.z
	move_and_slide()

func get_relative_mouse_position():
	var mouse_viewport_position = get_viewport().get_mouse_position()
	var origin = camera.project_ray_origin(mouse_viewport_position)
	var direction = camera.project_ray_normal(mouse_viewport_position)

	var distance = -origin.y/direction.y
	var mouse_plane_position = origin + (direction * distance)
	
	var relative_position_to_mouse = mouse_plane_position - global_position
	relative_position_to_mouse.y = 0
	
	return relative_position_to_mouse
審�RSRC                    PackedScene            ��������                                                  ..    resource_local_to_scene    resource_name    custom_solver_bias    margin    size    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    top_radius    bottom_radius    height    radial_segments    rings    cap_top    cap_bottom    subdivide_width    subdivide_height    subdivide_depth 	   _bundled       Script    res://assets/train.gd ��������	   Material    res://materials/wood.tres LM���?�.	   Material    res://materials/metal.tres �B�gt\	   Material    res://materials/black.tres �^(q�&X      local://BoxShape3D_q8nie I         local://CylinderMesh_1biwr x         local://BoxMesh_cfp2e �         local://PackedScene_y62dm �         BoxShape3D          ��Y@��,@ff�?         CylinderMesh             BoxMesh             PackedScene          	         names "         CharacterBody3D 
   transform    script    CollisionShape3D    shape    Train    Node3D    Wheels    Wheel1    material_override    mesh 	   skeleton    MeshInstance3D    MeshInstance3D9    MeshInstance3D10    MeshInstance3D11    MeshInstance3D12    MeshInstance3D13    Body    MeshInstance3D2    MeshInstance3D5    MeshInstance3D3    MeshInstance3D4 	   Camera3D 	   MouseRay 
   RayCast3D    	   variants            �?              �?              �?    �>                   �?              �?              �?    -[�?                   �?            �|W�  ��    *�=1�;�rP���1�>@�                                         �?            �|W�  ��    *�=1�;����=�1�>@�     �?            �|W�  ��    *�=1�;��.�?�1�>@�     �?            �|W�  ��    *�=1�;�
����1�>�K?     �?            �|W�  ��    *�=1�;����=�1�>�?     �?            �|W�  ��    *�=1�;��.�?�1�>�?     @@              �?              �?    ��[?                           �?            M-�?            3��?n�L�`��?       
��?            ,�8?            �O�?n�L����?                  �>              �?              �>�8�?5c�?       ���>            ��L>            ���>���?ę@�h;     �?            ��>k^?    k^���>    ��A	�TA      node_count             nodes     �   ��������        ����                                  ����                                 ����                     ����                     ����         	      
                             ����         	      
                             ����      	   	      
                             ����      
   	      
                             ����         	      
                             ����         	      
                             ����        
             ����         	      
                
             ����         	      
                
             ����         	      
                
             ����         	      
                
             ����         	      
                              ����                           ����              conn_count              conns               node_paths              editable_instances              version             RSRC�RSRC                    StandardMaterial3D            ��������                                            n      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_w3r87 �	         StandardMaterial3D              �� =      �?      333?m      RSRC��}��f�RSRC                    StandardMaterial3D            ��������                                            n      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_lbla3 �	         StandardMaterial3D            �?    ��>  �?      333?m      RSRC�qE�|���RSRC                    StandardMaterial3D            ��������                                            n      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_3ntbn �	         StandardMaterial3D          ��,?���>s� >  �?m      RSRC#�nGST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[ uk�B�a�CV��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c5bjfkvkggibu"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 c�c�����\�M��extends CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready():
	input_p


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
l�RSRC                    PackedScene            ��������                                            �      resource_local_to_scene    resource_name    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    script    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    size    subdivide_width    subdivide_depth    center_offset    orientation    custom_solver_bias    margin    data    backface_collision    subdivide_height 	   _bundled       PackedScene    res://assets/train.tscn Y[���x   $   local://ProceduralSkyMaterial_dbh4w u         local://Sky_0f6ml �         local://Environment_artb0          local://PlaneMesh_i276t K      $   local://ConcavePolygonShape3D_ecif5 e         local://BoxMesh_vlgbt �         local://PackedScene_ij6uq �         ProceduralSkyMaterial          ���>���>��?  �?      ^e%?��'?7�+?  �?	      ^e%?��'?7�+?  �?         Sky                          Environment                         !               
   PlaneMesh             ConcavePolygonShape3D    ~   #        �?      �?  ��      �?  �?      ��  ��      �?  ��      ��  �?      ��         BoxMesh             PackedScene    �      	         names "         Node3D    WorldEnvironment    environment    DirectionalLight3D 
   transform    shadow_enabled    Floor    mesh    MeshInstance3D    StaticBody3D    CollisionShape3D    shape    cube    cube2    cube3    cube4    cube5    cube6    cube7    cube8    cube9    cube10    cube11    cube12    _plane_input_event    input_event    	   variants                   г]��ݾ  �>       ?г]?   �  @?�ݾ                       �B              �B              �B                                             �?              �?              �?    rj'>         �?              �?              �?��}A�N|?䔇�              �?              �?              �?��}A�N|?�A     �?              �?              �?]�B�N|?O@�     �?              �?              �?]�B�N|?5{��     �?              �?              �?�!���N|?��=@     �?              �?              �?�!���N|?���A     �?              �?              �?�!���N|?ѢH�     �?              �?              �?�!���N|?�#��     �?              �?              �?4�&��N|?ѢH�     �?              �?              �?4�&��N|?�#��     �?              �?              �?4�&��N|?��6�     �?              �?              �?4�&��N|?�mmA      node_count             nodes     �   ��������        ����                      ����                            ����                                 ����                          	   	   ����               
   
   ����                     ���                                  ����            	                     ����      
      	                     ����            	                     ����            	                     ����            	                     ����            	                     ����            	                     ����            	                     ����            	                     ����            	                     ����            	                     ����            	             conn_count             conns                                     node_paths              editable_instances              version             RSRCA��6Y�b4+Q	4�P[remap]

path="res://.godot/exported/133200997/export-3f031b8c55535d1bbd6124fa0d796622-train.scn"
)l�L~D$.��Z߬[remap]

path="res://.godot/exported/133200997/export-d54ac8696c499bd006a8cd0ae6f1937a-black.res"
��`3J@�9#D�Y�v[remap]

path="res://.godot/exported/133200997/export-3a1abee5a719ca68f78c72218e95b515-metal.res"
�K@r�^O�8|7��=[remap]

path="res://.godot/exported/133200997/export-6bab30075bec6dca5efb9a8285be1fb5-wood.res"
J>諂�aДc����o[remap]

path="res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn"
i8q��>�>ᦄRlist=Array[Dictionary]([])
$�j�K<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
H���f�n   Y[���x   res://assets/train.tscn�^(q�&X   res://materials/black.tres�B�gt\   res://materials/metal.tresLM���?�.   res://materials/wood.tresf8�&��~_   res://icon.svg+�a�   res://scene.tscn��ECFG      application/config/name         Train      application/run/main_scene         res://scene.tscn   application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     input/Sprint�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script            deadzone      ?   input/slow_down�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script            deadzone      ?#   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibilitya�=�