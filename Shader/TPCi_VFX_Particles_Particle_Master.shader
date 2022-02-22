//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Master" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_SpriteTextureDiffuse ("Sprite Texture (Diffuse)", 2D) = "white" { }
[Toggle(_DOESDIFFUSEHAVEALPHACHANNELTRUEUSEALPHAFALSEUSEDIFFUSEASALPHA_ON)] _DoesDiffuseHaveAlphaChannelTrueUsealphaFalseUseDiffuseasAlpha ("Does Diffuse Have Alpha Channel? (True = Use alpha, False = Use Diffuse as Alpha)", Float) = 0
_AddWhiteToDiffuse1tomakediffusewhite ("Add White To Diffuse (1 to make diffuse white)", Range(0, 1)) = 1
_AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex ("Add White To Alpha (1 to make Alpha white - Use if using another dissolve tex)", Float) = 0
_DiffuseLightnessUsefultolowerlightnessofspriteifitswhite ("Diffuse Lightness (Useful to lower lightness of sprite if it's white)", Range(0, 1)) = 1
_TextureDesaturation ("Texture Desaturation", Range(0, 1)) = 0
_EmissiveProperties ("----------------Emissive Properties----------------", Float) = 1
[Toggle(_ADDEMISSIVEONTOPOFDIFFUSEORONLYINMASKEDAREA_ON)] _AddEmissiveOntopofDiffuseorOnlyinMaskedArea ("Add Emissive On top of Diffuse or Only in Masked Area?  ", Float) = 0
_EmissiveIntensity ("Emissive Intensity", Float) = 1
_EmissiveDissolveThresholdMax ("Emissive Dissolve Threshold Max", Float) = 1
_EmissiveDissolveThresholdMin ("Emissive Dissolve Threshold Min", Float) = 0
_EmissiveMask ("Emissive Mask", 2D) = "white" { }
_EmissiveMaskTiling ("Emissive Mask Tiling", Vector) = (1,1,0,0)
_EmissiveMaskOffset ("Emissive Mask Offset", Vector) = (0,0,0,0)
_DissolveProperties ("----------------Dissolve Properties----------------", Float) = 1
[Toggle(_CONTROLDISSOVETHROUGHCUSTOMCURVE_ON)] _ControlDissoveThroughCustomCurve ("Control Dissove Through Custom Curve", Float) = 0
[Toggle(_USEDISSOLVETEXTURE_ON)] _UseDissolveTexture ("Use Dissolve Texture?", Float) = 0
[Toggle(_ALPHADISSOLVEMASKDIFFUSEFALSEALPHATRUE_ON)] _AlphaDissolveMaskDiffuseFalseAlphaTrue ("Alpha Dissolve Mask - (Diffuse = False) (Alpha =  True)", Float) = 0
_AlphaDissolveMask ("Alpha Dissolve Mask", 2D) = "white" { }
_AlphaDissolveAmount ("Alpha Dissolve Amount", Range(0, 1)) = 1
_AlphaDissolveMaskTiling ("Alpha Dissolve Mask Tiling", Vector) = (1,1,0,0)
_AlphaDissolveMaskOffset ("Alpha Dissolve Mask Offset", Vector) = (0,0,0,0)
_AlphaDissolveMaskPanSpeed ("Alpha Dissolve Mask Pan Speed", Vector) = (0,0,0,0)
_DissolveThresholdMax ("Dissolve Threshold Max", Float) = 1
_DissolveThresholdMin ("Dissolve Threshold Min", Float) = 0
_ParticleCameraOffset ("Particle Camera Offset", Float) = 0
[Toggle(_USECUSTOMEMISSIVECOLORUSEFULIFEMISSIVESHOULDBEDIFFERENTTHANPARTICLECOLOR_ON)] _UseCustomEmissiveColorUsefulifEmissiveshouldbedifferentthanparticlecolor ("Use Custom Emissive Color? (Useful if Emissive should be different than particle color)", Float) = 0
_EmissiveColor ("Emissive Color", Color) = (1,1,1,0)
_DistortionProperties ("----------------Distortion Properties----------------", Float) = 1
_DistortionTexture ("Distortion Texture", 2D) = "white" { }
_DistortionTexturePanning ("Distortion Texture Panning", Vector) = (0,0,0,0)
_DistortionTextureTiling ("Distortion Texture Tiling", Vector) = (1,1,0,0)
_DistortionTextureOffset ("Distortion Texture Offset", Vector) = (0,0,0,0)
_DistortionAmount ("Distortion Amount", Float) = 0
[Toggle(_CONTROLALPHATHROUGHPARTICLEVERTALPHA_ON)] _ControlAlphathroughParticleVertAlpha ("Control Alpha through Particle Vert Alpha", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 35489
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ParticleCameraOffset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = vec3(vec3(_ParticleCameraOffset, _ParticleCameraOffset, _ParticleCameraOffset)) * u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _EmissiveDissolveThresholdMin;
uniform 	float _EmissiveDissolveThresholdMax;
uniform 	vec2 _EmissiveMaskTiling;
uniform 	vec2 _EmissiveMaskOffset;
uniform 	vec2 _DistortionTexturePanning;
uniform 	vec2 _DistortionTextureTiling;
uniform 	vec2 _DistortionTextureOffset;
uniform 	float _DistortionProperties;
uniform 	float _DistortionAmount;
uniform 	float _TextureDesaturation;
uniform 	float _AddWhiteToDiffuse1tomakediffusewhite;
uniform 	float _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
uniform 	float _EmissiveIntensity;
uniform 	float _DissolveThresholdMin;
uniform 	float _DissolveThresholdMax;
uniform 	float _DissolveProperties;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveMask;
UNITY_LOCATION(2) uniform mediump sampler2D _SpriteTextureDiffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
vec2 u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _DistortionTextureTiling.xy + vec2(_DistortionTextureOffset.x, _DistortionTextureOffset.y);
    u_xlat0.xy = _Time.yy * vec2(_DistortionTexturePanning.x, _DistortionTexturePanning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_DistortionProperties);
    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(_EmissiveMaskTiling.x, _EmissiveMaskTiling.y) + _EmissiveMaskOffset.xy;
    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_SpriteTextureDiffuse, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_EmissiveMask, u_xlat6.xy).xyz;
    u_xlat9 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat2.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat9);
    u_xlat0.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat2.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(_EmissiveDissolveThresholdMin));
    u_xlat9 = (-_EmissiveDissolveThresholdMin) + _EmissiveDissolveThresholdMax;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat9 = _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_1.xyz;
    u_xlat10 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat4.xyz = (-u_xlat16_1.xyz) * vec3(u_xlat9) + vec3(u_xlat10);
    u_xlat4.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + vec3(_AddWhiteToDiffuse1tomakediffusewhite);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD0.www + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat9 = max(_EmissiveIntensity, 0.0);
    u_xlat9 = min(u_xlat9, 10000.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat4.x = vs_COLOR0.w * _DissolveProperties;
    u_xlat1 = u_xlat16_1.x * u_xlat4.x + (-_DissolveThresholdMin);
    u_xlat4.x = (-_DissolveThresholdMin) + _DissolveThresholdMax;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat1 = u_xlat4.x * u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat1 * -2.0 + 3.0;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat0.w = u_xlat1 * u_xlat4.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" "_ADDEMISSIVEONTOPOFDIFFUSEORONLYINMASKEDAREA_ON" "_ALPHADISSOLVEMASKDIFFUSEFALSEALPHATRUE_ON" "_CONTROLALPHATHROUGHPARTICLEVERTALPHA_ON" "_CONTROLDISSOVETHROUGHCUSTOMCURVE_ON" "_DOESDIFFUSEHAVEALPHACHANNELTRUEUSEALPHAFALSEUSEDIFFUSEASALPHA_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ParticleCameraOffset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = vec3(vec3(_ParticleCameraOffset, _ParticleCameraOffset, _ParticleCameraOffset)) * u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	float _EmissiveDissolveThresholdMin;
uniform 	float _EmissiveDissolveThresholdMax;
uniform 	vec2 _EmissiveMaskTiling;
uniform 	vec2 _EmissiveMaskOffset;
uniform 	vec2 _DistortionTexturePanning;
uniform 	vec2 _DistortionTextureTiling;
uniform 	vec2 _DistortionTextureOffset;
uniform 	float _DistortionProperties;
uniform 	float _DistortionAmount;
uniform 	float _TextureDesaturation;
uniform 	float _AddWhiteToDiffuse1tomakediffusewhite;
uniform 	float _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
uniform 	float _EmissiveIntensity;
uniform 	float _DissolveThresholdMin;
uniform 	float _DissolveThresholdMax;
uniform 	float _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
uniform 	float _DissolveProperties;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMask;
UNITY_LOCATION(3) uniform mediump sampler2D _SpriteTextureDiffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
float u_xlat9;
float u_xlat11;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _DistortionTextureTiling.xy + vec2(_DistortionTextureOffset.x, _DistortionTextureOffset.y);
    u_xlat0.xy = _Time.yy * vec2(_DistortionTexturePanning.x, _DistortionTexturePanning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_DistortionProperties);
    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(_EmissiveMaskTiling.x, _EmissiveMaskTiling.y) + _EmissiveMaskOffset.xy;
    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_SpriteTextureDiffuse, u_xlat0.xy);
    u_xlat16_0.xyz = texture(_EmissiveMask, u_xlat6.xy).xyz;
    u_xlat9 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat2.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat9);
    u_xlat0.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat2.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(_EmissiveDissolveThresholdMin));
    u_xlat9 = (-_EmissiveDissolveThresholdMin) + _EmissiveDissolveThresholdMax;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD0.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat9 = _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_1.xyz;
    u_xlat11 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.xyz = (-u_xlat16_1.xyz) * vec3(u_xlat9) + vec3(u_xlat11);
    u_xlat9 = u_xlat16_1.w + _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
    u_xlat1.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + vec3(_AddWhiteToDiffuse1tomakediffusewhite);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz * vs_COLOR0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.x = max(_EmissiveIntensity, 0.0);
    u_xlat1.x = min(u_xlat1.x, 10000.0);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.x = vs_TEXCOORD0.z * _DissolveProperties;
    u_xlat0.x = u_xlat9 * u_xlat0.x + (-_DissolveThresholdMin);
    u_xlat3.x = (-_DissolveThresholdMin) + _DissolveThresholdMax;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat3.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat3.xy).x;
    u_xlat3.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-vs_TEXCOORD2.z);
    u_xlat3.x = u_xlat3.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * vs_COLOR0.w;
    u_xlat1.w = u_xlat3.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ParticleCameraOffset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = vec3(vec3(_ParticleCameraOffset, _ParticleCameraOffset, _ParticleCameraOffset)) * u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	float _EmissiveDissolveThresholdMin;
uniform 	float _EmissiveDissolveThresholdMax;
uniform 	vec2 _EmissiveMaskTiling;
uniform 	vec2 _EmissiveMaskOffset;
uniform 	vec2 _DistortionTexturePanning;
uniform 	vec2 _DistortionTextureTiling;
uniform 	vec2 _DistortionTextureOffset;
uniform 	float _DistortionProperties;
uniform 	float _DistortionAmount;
uniform 	float _TextureDesaturation;
uniform 	float _AddWhiteToDiffuse1tomakediffusewhite;
uniform 	float _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
uniform 	float _EmissiveIntensity;
uniform 	float _DissolveThresholdMin;
uniform 	float _DissolveThresholdMax;
uniform 	float _DissolveProperties;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMask;
UNITY_LOCATION(3) uniform mediump sampler2D _SpriteTextureDiffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
vec2 u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _DistortionTextureTiling.xy + vec2(_DistortionTextureOffset.x, _DistortionTextureOffset.y);
    u_xlat0.xy = _Time.yy * vec2(_DistortionTexturePanning.x, _DistortionTexturePanning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_DistortionProperties);
    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(_EmissiveMaskTiling.x, _EmissiveMaskTiling.y) + _EmissiveMaskOffset.xy;
    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_SpriteTextureDiffuse, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_EmissiveMask, u_xlat6.xy).xyz;
    u_xlat9 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat2.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat9);
    u_xlat0.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat2.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(_EmissiveDissolveThresholdMin));
    u_xlat9 = (-_EmissiveDissolveThresholdMin) + _EmissiveDissolveThresholdMax;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat9 = _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_1.xyz;
    u_xlat10 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat4.xyz = (-u_xlat16_1.xyz) * vec3(u_xlat9) + vec3(u_xlat10);
    u_xlat4.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + vec3(_AddWhiteToDiffuse1tomakediffusewhite);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD0.www + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat9 = max(_EmissiveIntensity, 0.0);
    u_xlat9 = min(u_xlat9, 10000.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat4.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat4.x = texture(_CameraDepthTexture, u_xlat4.xy).x;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat4.x = u_xlat4.x + (-vs_TEXCOORD2.z);
    u_xlat4.x = u_xlat4.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * vs_COLOR0.w;
    u_xlat4.x = u_xlat4.x * _DissolveProperties;
    u_xlat1 = u_xlat16_1.x * u_xlat4.x + (-_DissolveThresholdMin);
    u_xlat4.x = (-_DissolveThresholdMin) + _DissolveThresholdMax;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat1 = u_xlat4.x * u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat1 * -2.0 + 3.0;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat0.w = u_xlat1 * u_xlat4.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDEMISSIVEONTOPOFDIFFUSEORONLYINMASKEDAREA_ON" "_ALPHADISSOLVEMASKDIFFUSEFALSEALPHATRUE_ON" "_CONTROLALPHATHROUGHPARTICLEVERTALPHA_ON" "_CONTROLDISSOVETHROUGHCUSTOMCURVE_ON" "_DOESDIFFUSEHAVEALPHACHANNELTRUEUSEALPHAFALSEUSEDIFFUSEASALPHA_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ParticleCameraOffset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = vec3(vec3(_ParticleCameraOffset, _ParticleCameraOffset, _ParticleCameraOffset)) * u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _EmissiveDissolveThresholdMin;
uniform 	float _EmissiveDissolveThresholdMax;
uniform 	vec2 _EmissiveMaskTiling;
uniform 	vec2 _EmissiveMaskOffset;
uniform 	vec2 _DistortionTexturePanning;
uniform 	vec2 _DistortionTextureTiling;
uniform 	vec2 _DistortionTextureOffset;
uniform 	float _DistortionProperties;
uniform 	float _DistortionAmount;
uniform 	float _TextureDesaturation;
uniform 	float _AddWhiteToDiffuse1tomakediffusewhite;
uniform 	float _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
uniform 	float _EmissiveIntensity;
uniform 	float _DissolveThresholdMin;
uniform 	float _DissolveThresholdMax;
uniform 	float _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
uniform 	float _DissolveProperties;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveMask;
UNITY_LOCATION(2) uniform mediump sampler2D _SpriteTextureDiffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat9;
float u_xlat11;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _DistortionTextureTiling.xy + vec2(_DistortionTextureOffset.x, _DistortionTextureOffset.y);
    u_xlat0.xy = _Time.yy * vec2(_DistortionTexturePanning.x, _DistortionTexturePanning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_DistortionProperties);
    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(_EmissiveMaskTiling.x, _EmissiveMaskTiling.y) + _EmissiveMaskOffset.xy;
    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_SpriteTextureDiffuse, u_xlat0.xy);
    u_xlat16_0.xyz = texture(_EmissiveMask, u_xlat6.xy).xyz;
    u_xlat9 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat2.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat9);
    u_xlat0.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat2.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(_EmissiveDissolveThresholdMin));
    u_xlat9 = (-_EmissiveDissolveThresholdMin) + _EmissiveDissolveThresholdMax;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD0.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat9 = _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_1.xyz;
    u_xlat11 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.xyz = (-u_xlat16_1.xyz) * vec3(u_xlat9) + vec3(u_xlat11);
    u_xlat9 = u_xlat16_1.w + _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
    u_xlat1.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + vec3(_AddWhiteToDiffuse1tomakediffusewhite);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz * vs_COLOR0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.x = max(_EmissiveIntensity, 0.0);
    u_xlat1.x = min(u_xlat1.x, 10000.0);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.x = vs_TEXCOORD0.z * _DissolveProperties;
    u_xlat0.x = u_xlat9 * u_xlat0.x + (-_DissolveThresholdMin);
    u_xlat3 = (-_DissolveThresholdMin) + _DissolveThresholdMax;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" "_ADDEMISSIVEONTOPOFDIFFUSEORONLYINMASKEDAREA_ON" "_ALPHADISSOLVEMASKDIFFUSEFALSEALPHATRUE_ON" "_CONTROLALPHATHROUGHPARTICLEVERTALPHA_ON" "_CONTROLDISSOVETHROUGHCUSTOMCURVE_ON" "_DOESDIFFUSEHAVEALPHACHANNELTRUEUSEALPHAFALSEUSEDIFFUSEASALPHA_ON" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "gles3 " {
Keywords { "_ADDEMISSIVEONTOPOFDIFFUSEORONLYINMASKEDAREA_ON" "_ALPHADISSOLVEMASKDIFFUSEFALSEALPHATRUE_ON" "_CONTROLALPHATHROUGHPARTICLEVERTALPHA_ON" "_CONTROLDISSOVETHROUGHCUSTOMCURVE_ON" "_DOESDIFFUSEHAVEALPHACHANNELTRUEUSEALPHAFALSEUSEDIFFUSEASALPHA_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}