varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;

void main()
{
    gl_FragColor = 1.0 - texture2D(texture_sampler, var_texcoord0.xy).aaaa * 1.25;
}
