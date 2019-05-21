varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp sampler2D texture_sampler_shadow;
uniform lowp vec4 tint;

void main()
{
    lowp vec2 shadow_uv = gl_FragCoord.st / vec2(1024.0,768.0);

    lowp vec4 shadow = texture2D(texture_sampler_shadow, shadow_uv);
    lowp vec4 color  = texture2D(texture_sampler, var_texcoord0.xy);

    gl_FragColor = vec4(color.rgb * mix(shadow.r,1.0,tint.w),color.a);
}
