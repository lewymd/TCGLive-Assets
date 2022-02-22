//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "SCG/PlayingBoard" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
_HexTex ("Hex Texture", 2D) = "white" { }
_HexRedirTex ("Hex Redirection Texture", 2D) = "white" { }
_MixTex ("Mask Texture", 2D) = "white" { }
_BoardMask ("Board Mask", 2D) = "white" { }
_BoardNormal ("Board Normal Texture", 2D) = "white" { }
_BoardNormalIntensity ("Board Normal Intensity", Range(0, 2)) = 1
_Effect ("Effect Texture", 2D) = "white" { }
_HexDensity ("Hex Pattern Density", Range(-8, 8)) = 2
_EffectFade ("Effect Fade", Range(0, 1)) = 1
_EffectWipe ("Effect Wipe", Range(0, 1)) = 1
_EffectWipePinch ("Effect Wipe Pinch", Range(0, 1)) = 1
_EffectWipePinchPower ("Effect Wipe Pinch Power", Range(0, 1)) = 1
_EffectGrout ("Effect Grout Fade", Range(0, 1)) = 1
_GroutIntensity ("Grout Intensity", Range(0, 1)) = 0.7
_GroutBlend ("Grout Blend Amount", Range(0, 1)) = 0.15
_GroutColor ("Grout Color", Color) = (1,1,0,1)
_BoardTileIntensity ("Tile Intensity", Vector) = (1,1,1,1)
_BoardBevelAmount ("Board Bevel Amount", Range(0, 1)) = 1
_BoardGlowColor ("Board Glow Color", Color) = (1,1,1,1)
_BoardGlow ("Board Glow", Range(0, 2)) = 1
_RedChannelColor ("Red FX Mask Color", Color) = (1,1,0,1)
_RedVector ("Red Vector", Vector) = (1,0,0,0)
_GreenChannelColor ("Green FX Mask Color", Color) = (0,1,0,1)
_GreenVector ("Green Vector", Vector) = (1,0,0,0)
_BlueChannelColor ("Blue FX Mask Color", Color) = (0,1,1,1)
_BlueVector ("Blue Vector", Vector) = (1,0,0,0)
_AlphaChannelColor ("Alpha FX Mask Color", Color) = (1,1,1,1)
_AlphaVector ("Alpha Vector", Vector) = (1,0,0,0)
_LightDirection ("Light Direction Vector", Vector) = (0,0,-1,0)
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 26231
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_TANGENT0.www + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec4 _RedChannelColor;
uniform 	vec4 _RedVector;
uniform 	vec4 _GreenChannelColor;
uniform 	vec4 _GreenVector;
uniform 	vec4 _BlueChannelColor;
uniform 	vec4 _BlueVector;
uniform 	vec4 _AlphaChannelColor;
uniform 	vec4 _AlphaVector;
uniform 	float _EffectWipe;
uniform 	float _EffectWipePinch;
uniform 	float _EffectWipePinchPower;
uniform 	float _EffectFade;
uniform 	float _GroutIntensity;
uniform 	vec4 _GroutColor;
uniform 	float _BoardBevelAmount;
uniform 	float _BoardNormalIntensity;
uniform 	vec4 _BoardGlowColor;
uniform 	vec4 _BoardTileIntensity;
uniform 	vec4 _LightDirection;
uniform 	float _GroutBlend;
uniform 	float _BoardGlow;
uniform 	float _HexDensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HexTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Effect;
UNITY_LOCATION(3) uniform mediump sampler2D _BoardMask;
UNITY_LOCATION(4) uniform mediump sampler2D _BoardNormal;
UNITY_LOCATION(5) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MixTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec2 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat11;
float u_xlat12;
mediump float u_xlat16_19;
vec2 u_xlat21;
float u_xlat27;
float u_xlat29;
float u_xlat30;
void main()
{
    u_xlat0.x = (-_EffectFade) + 1.0;
    u_xlat16_9.xy = texture(_BoardMask, vs_TEXCOORD0.xy).xy;
    u_xlat16_1 = u_xlat16_9.y + u_xlat16_9.x;
    u_xlat16_10.x = (-u_xlat16_1) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat16_9.xyz = texture(_Effect, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat9.xyz = u_xlat16_9.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat27 = _AlphaVector.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat29 = _BlueVector.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat3.x = _GreenVector.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat12 = _RedVector.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat21.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat21.xy * vec2(vec2(_HexDensity, _HexDensity));
    u_xlat16_10.xy = fract(u_xlat4.xy);
    u_xlat16_10.xy = u_xlat21.xy * vec2(vec2(_HexDensity, _HexDensity)) + (-u_xlat16_10.xy);
    u_xlat16_5.xyz = texture(_HexRedirTex, u_xlat4.xy).xyz;
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_5.xy;
    u_xlat21.xy = u_xlat16_10.xy / vec2(vec2(_HexDensity, _HexDensity));
    u_xlat16_6 = texture(_MixTex, u_xlat21.xy);
    u_xlat16_5 = u_xlat16_5.zzzz * u_xlat16_6;
    u_xlat12 = u_xlat12 * u_xlat16_5.x + _EffectWipe;
    u_xlat3.x = u_xlat3.x * u_xlat16_5.y + u_xlat12;
    u_xlat29 = u_xlat29 * u_xlat16_5.z + u_xlat3.x;
    u_xlat27 = u_xlat27 * u_xlat16_5.w + u_xlat29;
    u_xlat29 = u_xlat27 + 0.0500000007;
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat27) + u_xlat29;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat16_3.xyz = texture(_HexTex, u_xlat4.xy).xyz;
    u_xlat16_4.xy = texture(_BoardNormal, u_xlat4.xy).yw;
    u_xlat4.xy = u_xlat16_4.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat30 = u_xlat16_3.x + -1.0;
    u_xlat30 = _EffectWipePinchPower * u_xlat30 + 1.0;
    u_xlat30 = (-u_xlat16_3.x) * u_xlat16_3.y + u_xlat30;
    u_xlat30 = (-u_xlat16_3.x) + u_xlat30;
    u_xlat30 = _EffectWipePinch * u_xlat30 + u_xlat16_3.x;
    u_xlat27 = (-u_xlat27) + u_xlat30;
    u_xlat27 = u_xlat29 * u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat16_10.xyz = (-u_xlat16_3.yxz) + vec3(1.0, 0.189999998, 1.0);
    u_xlat16_10.x = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat3.x = u_xlat16_7.x * u_xlat16_10.x + -1.0;
    u_xlat3.x = _BoardBevelAmount * u_xlat3.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.y * 33.3333664;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_19;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat29 * u_xlat27 + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat3.xxx * u_xlat16_7.xyz;
    u_xlat16_8.xyz = u_xlat16_3.zzz * u_xlat16_7.xyz;
    u_xlat0.x = (-_GroutBlend) + 1.0;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * u_xlat16_10.zzz + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * _GroutColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_GroutIntensity, _GroutIntensity, _GroutIntensity));
    u_xlat16_10.xyz = u_xlat16_3.zzz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(_GroutBlend) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * _BoardTileIntensity.xxx + (-u_xlat0.xyz);
    u_xlat16_6 = u_xlat16_5 * u_xlat16_5;
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * _BoardTileIntensity.yyy + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_6.yyy * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * _BoardTileIntensity.zzz + (-u_xlat0.xyz);
    u_xlat27 = u_xlat16_6.z * _BlueVector.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * _BoardTileIntensity.www + (-u_xlat0.xyz);
    u_xlat29 = u_xlat16_6.w * _AlphaVector.w;
    u_xlat0.xyz = vec3(u_xlat29) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.x = u_xlat16_6.x * _RedVector.w;
    u_xlat11 = u_xlat16_6.y * _GreenVector.w;
    u_xlat0.xyz = u_xlat2.xxx * _RedChannelColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat11) * _GreenChannelColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat27) * _BlueChannelColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat29) * _AlphaChannelColor.xyz + u_xlat0.xyz;
    u_xlat16_10.x = u_xlat16_3.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_19;
    u_xlat27 = u_xlat16_10.x * _RedVector.y;
    u_xlat27 = u_xlat16_3.z * _RedVector.x + u_xlat27;
    u_xlat27 = u_xlat16_5.x * u_xlat27;
    u_xlat0.xyz = _RedChannelColor.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat27 = u_xlat16_10.x * _GreenVector.y;
    u_xlat27 = u_xlat16_3.z * _GreenVector.x + u_xlat27;
    u_xlat27 = u_xlat16_5.y * u_xlat27;
    u_xlat0.xyz = _GreenChannelColor.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat27 = u_xlat16_10.x * _BlueVector.y;
    u_xlat27 = u_xlat16_3.z * _BlueVector.x + u_xlat27;
    u_xlat27 = u_xlat16_5.z * u_xlat27;
    u_xlat0.xyz = _BlueChannelColor.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat27 = u_xlat16_10.x * _AlphaVector.y;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_10.x;
    u_xlat2.x = u_xlat16_1 * _BoardGlow;
    u_xlat27 = u_xlat16_3.z * _AlphaVector.x + u_xlat27;
    u_xlat27 = u_xlat16_5.w * u_xlat27;
    u_xlat0.xyz = _AlphaChannelColor.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xxx * _BoardGlowColor.xyz + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat4.yyy * vs_TEXCOORD4.xyz;
    u_xlat2.xyz = u_xlat4.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xyz;
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat27 = dot(_LightDirection.xyz, _LightDirection.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat3.xyz = vec3(u_xlat27) * _LightDirection.xyz;
    u_xlat27 = dot(u_xlat2.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 + -1.0;
    u_xlat27 = _BoardNormalIntensity * u_xlat27 + 1.0;
    SV_Target0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = 1.0;
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
}
}
}
CustomEditor "BoardShaderinspector"
}