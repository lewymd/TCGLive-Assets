//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Simple_Alpha_Dissolve_Radial" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_ParticleAlphaMask ("Particle Alpha Mask", 2D) = "white" { }
_DissolveTexture ("Dissolve Texture", 2D) = "white" { }
_AlphaChannel ("Alpha Channel", Range(0, 1)) = 0
_SmoothstepMax ("Smoothstep Max", Float) = 1
_Alpha_Intensity ("Alpha_Intensity", Float) = 1
_MaskDistortionMap ("Mask Distortion Map", 2D) = "white" { }
_Maskpanspeed ("Mask pan speed", Vector) = (0,-1,0,0)
_MaskDistPower ("Mask Dist Power", Range(0.1, 5)) = 0.2088717
_MaskDistortNoise ("Mask Distort Noise", Range(-1, 1)) = 0
_DissolveIntensity ("Dissolve Intensity", Float) = 1
_RadialPannerSpeed ("Radial Panner Speed", Vector) = (0,-2,0,0)
_OverallAlphaIntensity ("Overall Alpha Intensity", Float) = 1
_Offset ("Offset", Float) = 0
_DissolveTiling ("Dissolve Tiling", Vector) = (1,0.5,0,0)
_Tint ("Tint", Color) = (1,0,0,0)
_TintPower ("Tint Power", Range(0, 10)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 47121
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
uniform 	float _Offset;
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
    u_xlat0.xyz = vec3(vec3(_Offset, _Offset, _Offset)) * u_xlat0.xyz + in_POSITION0.xyz;
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
uniform 	vec4 _Tint;
uniform 	vec2 _Maskpanspeed;
uniform 	float _MaskDistortNoise;
uniform 	float _MaskDistPower;
uniform 	float _AlphaChannel;
uniform 	float _Alpha_Intensity;
uniform 	float _SmoothstepMax;
uniform 	vec2 _RadialPannerSpeed;
uniform 	vec2 _DissolveTiling;
uniform 	float _DissolveIntensity;
uniform 	float _OverallAlphaIntensity;
uniform 	float _TintPower;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskDistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ParticleAlphaMask;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec2 u_xlat7;
vec3 u_xlat9;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(1.0);
    u_xlat1.xy = _Time.yy * _Maskpanspeed.xy + vs_TEXCOORD0.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_MaskDistortNoise, _MaskDistortNoise));
    u_xlat21 = dot(u_xlat15.xy, vec2(0.366025418, 0.366025418));
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_MaskDistortNoise, _MaskDistortNoise)) + vec2(u_xlat21);
    u_xlat15.xy = floor(u_xlat15.xy);
    u_xlat2.xy = u_xlat15.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = (-u_xlat2.xy) * vec2(289.0, 289.0) + u_xlat15.xy;
    u_xlat16.xy = u_xlat1.xy * vec2(vec2(_MaskDistortNoise, _MaskDistortNoise)) + (-u_xlat15.xy);
    u_xlat21 = dot(u_xlat15.xy, vec2(0.211324871, 0.211324871));
    u_xlat15.xy = vec2(u_xlat21) + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat15.y<u_xlat15.x);
#else
    u_xlatb21 = u_xlat15.y<u_xlat15.x;
#endif
    u_xlat3 = (bool(u_xlatb21)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat0.y = u_xlat3.y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.yyy;
    u_xlat9.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat9.xyz = floor(u_xlat9.xyz);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xxx + u_xlat0.xyz;
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(1.0);
    u_xlat2.y = u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat0.xyz = (-u_xlat2.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat5.x = dot(u_xlat15.xy, u_xlat15.xy);
    u_xlat6 = u_xlat15.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.xy = u_xlat3.zw + u_xlat6.xy;
    u_xlat5.y = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat5.z = dot(u_xlat6.zw, u_xlat6.zw);
    u_xlat3.xyz = (-u_xlat5.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz;
    u_xlat0.x = u_xlat15.y * u_xlat0.x;
    u_xlat7.xy = u_xlat0.yz * u_xlat6.yw;
    u_xlat4.yz = u_xlat2.yz * u_xlat6.xz + u_xlat7.xy;
    u_xlat4.x = u_xlat2.x * u_xlat15.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx + u_xlat1.xy;
    u_xlat16_0.x = texture(_MaskDistortionMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_MaskDistPower, _MaskDistPower)) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_ParticleAlphaMask, u_xlat0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat0.xyz = vec3(_AlphaChannel) * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha_Intensity, _Alpha_Intensity, _Alpha_Intensity));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat15.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat21 = u_xlat21 * u_xlat15.x;
    u_xlat15.x = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat15.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat15.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat15.x * u_xlat22 + -0.330299497;
    u_xlat15.x = u_xlat15.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat21 * u_xlat15.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb2 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat22 = u_xlatb2 ? u_xlat22 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat15.x + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb15 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat15.x = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat21 = u_xlat21 + u_xlat15.x;
    u_xlat15.x = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15.x<(-u_xlat15.x));
#else
    u_xlatb15 = u_xlat15.x<(-u_xlat15.x);
#endif
    u_xlat22 = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.y = _RadialPannerSpeed.y * _Time.y + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlatb15 = u_xlatb22 && u_xlatb15;
    u_xlat21 = (u_xlatb15) ? (-u_xlat21) : u_xlat21;
    u_xlat21 = u_xlat21 * 0.159154937;
    u_xlat21 = fract(u_xlat21);
    u_xlat1.x = _RadialPannerSpeed.x * _Time.y + u_xlat21;
    u_xlat15.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_15.xy = texture(_Sampler6054, u_xlat15.xy).xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_15.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_DissolveTiling.x, _DissolveTiling.y);
    u_xlat16_1.xyz = texture(_DissolveTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DissolveIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat21 = max(vs_TEXCOORD0.z, -1.0);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat1.xyz = (-vec3(u_xlat21)) + u_xlat1.xyz;
    u_xlat22 = u_xlat21 + _SmoothstepMax;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + u_xlat22;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_OverallAlphaIntensity, _OverallAlphaIntensity, _OverallAlphaIntensity));
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyw = u_xlat0.yzx * vs_COLOR0.www;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat1.xyz = vs_COLOR0.xyz + _Tint.xyz;
    u_xlat1.xyz = u_xlat0.wxy * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_TintPower, _TintPower, _TintPower));
    u_xlat0.xyz = exp2(u_xlat1.xyz);
    SV_Target0 = u_xlat0;
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
uniform 	float _Offset;
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
    u_xlat0.xyz = vec3(vec3(_Offset, _Offset, _Offset)) * u_xlat0.xyz + in_POSITION0.xyz;
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
uniform 	vec4 _Tint;
uniform 	vec2 _Maskpanspeed;
uniform 	float _MaskDistortNoise;
uniform 	float _MaskDistPower;
uniform 	float _AlphaChannel;
uniform 	float _Alpha_Intensity;
uniform 	float _SmoothstepMax;
uniform 	vec2 _RadialPannerSpeed;
uniform 	vec2 _DissolveTiling;
uniform 	float _DissolveIntensity;
uniform 	float _OverallAlphaIntensity;
uniform 	float _TintPower;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskDistortionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ParticleAlphaMask;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec2 u_xlat7;
vec3 u_xlat9;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(1.0);
    u_xlat1.xy = _Time.yy * _Maskpanspeed.xy + vs_TEXCOORD0.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_MaskDistortNoise, _MaskDistortNoise));
    u_xlat21 = dot(u_xlat15.xy, vec2(0.366025418, 0.366025418));
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_MaskDistortNoise, _MaskDistortNoise)) + vec2(u_xlat21);
    u_xlat15.xy = floor(u_xlat15.xy);
    u_xlat2.xy = u_xlat15.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = (-u_xlat2.xy) * vec2(289.0, 289.0) + u_xlat15.xy;
    u_xlat16.xy = u_xlat1.xy * vec2(vec2(_MaskDistortNoise, _MaskDistortNoise)) + (-u_xlat15.xy);
    u_xlat21 = dot(u_xlat15.xy, vec2(0.211324871, 0.211324871));
    u_xlat15.xy = vec2(u_xlat21) + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat15.y<u_xlat15.x);
#else
    u_xlatb21 = u_xlat15.y<u_xlat15.x;
#endif
    u_xlat3 = (bool(u_xlatb21)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat0.y = u_xlat3.y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.yyy;
    u_xlat9.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat9.xyz = floor(u_xlat9.xyz);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xxx + u_xlat0.xyz;
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(1.0);
    u_xlat2.y = u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat0.xyz = (-u_xlat2.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat5.x = dot(u_xlat15.xy, u_xlat15.xy);
    u_xlat6 = u_xlat15.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.xy = u_xlat3.zw + u_xlat6.xy;
    u_xlat5.y = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat5.z = dot(u_xlat6.zw, u_xlat6.zw);
    u_xlat3.xyz = (-u_xlat5.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz;
    u_xlat0.x = u_xlat15.y * u_xlat0.x;
    u_xlat7.xy = u_xlat0.yz * u_xlat6.yw;
    u_xlat4.yz = u_xlat2.yz * u_xlat6.xz + u_xlat7.xy;
    u_xlat4.x = u_xlat2.x * u_xlat15.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx + u_xlat1.xy;
    u_xlat16_0.x = texture(_MaskDistortionMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_MaskDistPower, _MaskDistPower)) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_ParticleAlphaMask, u_xlat0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat0.xyz = vec3(_AlphaChannel) * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha_Intensity, _Alpha_Intensity, _Alpha_Intensity));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat15.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat21 = u_xlat21 * u_xlat15.x;
    u_xlat15.x = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat15.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat15.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat15.x * u_xlat22 + -0.330299497;
    u_xlat15.x = u_xlat15.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat21 * u_xlat15.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb2 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat22 = u_xlatb2 ? u_xlat22 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat15.x + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb15 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat15.x = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat21 = u_xlat21 + u_xlat15.x;
    u_xlat15.x = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15.x<(-u_xlat15.x));
#else
    u_xlatb15 = u_xlat15.x<(-u_xlat15.x);
#endif
    u_xlat22 = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.y = _RadialPannerSpeed.y * _Time.y + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlatb15 = u_xlatb22 && u_xlatb15;
    u_xlat21 = (u_xlatb15) ? (-u_xlat21) : u_xlat21;
    u_xlat21 = u_xlat21 * 0.159154937;
    u_xlat21 = fract(u_xlat21);
    u_xlat1.x = _RadialPannerSpeed.x * _Time.y + u_xlat21;
    u_xlat15.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_15.xy = texture(_Sampler6054, u_xlat15.xy).xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_15.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_DissolveTiling.x, _DissolveTiling.y);
    u_xlat16_1.xyz = texture(_DissolveTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DissolveIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat21 = max(vs_TEXCOORD0.z, -1.0);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat1.xyz = (-vec3(u_xlat21)) + u_xlat1.xyz;
    u_xlat22 = u_xlat21 + _SmoothstepMax;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + u_xlat22;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_OverallAlphaIntensity, _OverallAlphaIntensity, _OverallAlphaIntensity));
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.z * u_xlat21 + _ZBufferParams.w;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 + (-vs_TEXCOORD2.z);
    u_xlat21 = u_xlat21 * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * vs_COLOR0.w;
    u_xlat0.xyw = u_xlat0.yzx * vec3(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat1.xyz = vs_COLOR0.xyz + _Tint.xyz;
    u_xlat1.xyz = u_xlat0.wxy * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_TintPower, _TintPower, _TintPower));
    u_xlat0.xyz = exp2(u_xlat1.xyz);
    SV_Target0 = u_xlat0;
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
Keywords { "SOFTPARTICLES_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}