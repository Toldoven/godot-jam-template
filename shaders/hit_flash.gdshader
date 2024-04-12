shader_type canvas_item;
render_mode unshaded;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform vec3 tint : source_color = vec3(1.0, 1.0, 1.0);
uniform float blend : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	vec4 c = textureLod(screen_texture, SCREEN_UV, 0.0);

	// This hack is needed to make it work with CanvasGroup
	if (c.a > 0.0001) {
		c.rgb /= c.a;
	}

	COLOR *= c;

	COLOR.rgb = mix(COLOR.rgb, tint, blend);
}