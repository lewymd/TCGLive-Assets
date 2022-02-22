//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/FrontEnd/BadgeGlow_Smoke_RadialMask" {
Properties {
_RadialGradientSmoothstepMin1 ("Radial Gradient Smoothstep Min", Float) = 0.48
_TextureSample0 ("Texture Sample 0", 2D) = "white" { }
_RadialGradientSmoothstepMax1 ("Radial Gradient Smoothstep Max", Range(0, 4)) = 1.329391
_Min ("Min", Float) = 0
_brightness ("brightness", Float) = 3
_opacity ("opacity", Range(0, 1)) = 1
_Texture0 ("Texture 0", 2D) = "white" { }
_T_VFX_RankBadge_HexMask ("T_VFX_RankBadge_HexMask", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
  ZWrite Off
  Cull Off
  GpuProgramID 30417
Program "vp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _brightness;
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
UNITY_LOCATION(4) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
bool u_xlatb4;
float u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1.x = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat9 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat9 * u_xlat1.x + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat9 * u_xlat6;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb4 ? u_xlat1.x : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb3 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat3.x = (u_xlatb3) ? (-u_xlat6) : u_xlat6;
    u_xlat3.x = u_xlat3.x * 0.159154937;
    u_xlat1.x = fract(u_xlat3.x);
    u_xlat3.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_7.xy = texture(_Sampler6053, u_xlat3.xy).xy;
    u_xlat16_3.xy = texture(_Sampler6054, u_xlat3.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat7.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_7.xy;
    u_xlat3.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_3.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat7.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_1.xyz) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.x = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xxx;
    u_xlat1.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Min, _Min, _Min)));
    u_xlat16_1.xyz = texture(_TextureSample0, u_xlat1.xy).xyz;
    u_xlat9 = (-_Min) + 1.0;
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
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(0.546097577, 0.380348802, 0.387558699) + vec3(0.138142705, 0.554101586, 0.591114223);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_brightness);
    u_xlat0.yzw = u_xlat3.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_1.x = texture(_T_VFX_RankBadge_HexMask, u_xlat1.xy).x;
    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat2 = u_xlat0.yzwx * u_xlat1.xxxx;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    vs_TEXCOORD3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _brightness;
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
UNITY_LOCATION(4) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
bool u_xlatb4;
float u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1.x = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat9 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat9 * u_xlat1.x + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat9 * u_xlat6;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb4 ? u_xlat1.x : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb3 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat3.x = (u_xlatb3) ? (-u_xlat6) : u_xlat6;
    u_xlat3.x = u_xlat3.x * 0.159154937;
    u_xlat1.x = fract(u_xlat3.x);
    u_xlat3.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_7.xy = texture(_Sampler6053, u_xlat3.xy).xy;
    u_xlat16_3.xy = texture(_Sampler6054, u_xlat3.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat7.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_7.xy;
    u_xlat3.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_3.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat7.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_1.xyz) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.x = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xxx;
    u_xlat1.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Min, _Min, _Min)));
    u_xlat16_1.xyz = texture(_TextureSample0, u_xlat1.xy).xyz;
    u_xlat9 = (-_Min) + 1.0;
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
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(0.546097577, 0.380348802, 0.387558699) + vec3(0.138142705, 0.554101586, 0.591114223);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_brightness);
    u_xlat0.yzw = u_xlat3.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_1.x = texture(_T_VFX_RankBadge_HexMask, u_xlat1.xy).x;
    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat2 = u_xlat0.yzwx * u_xlat1.xxxx;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _brightness;
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
UNITY_LOCATION(4) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
bool u_xlatb4;
float u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1.x = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat9 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat9 * u_xlat1.x + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat9 * u_xlat6;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb4 ? u_xlat1.x : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb3 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat3.x = (u_xlatb3) ? (-u_xlat6) : u_xlat6;
    u_xlat3.x = u_xlat3.x * 0.159154937;
    u_xlat1.x = fract(u_xlat3.x);
    u_xlat3.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_7.xy = texture(_Sampler6053, u_xlat3.xy).xy;
    u_xlat16_3.xy = texture(_Sampler6054, u_xlat3.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat7.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_7.xy;
    u_xlat3.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_3.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat7.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_1.xyz) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.x = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xxx;
    u_xlat1.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Min, _Min, _Min)));
    u_xlat16_1.xyz = texture(_TextureSample0, u_xlat1.xy).xyz;
    u_xlat9 = (-_Min) + 1.0;
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
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(0.546097577, 0.380348802, 0.387558699) + vec3(0.138142705, 0.554101586, 0.591114223);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_brightness);
    u_xlat0.yzw = u_xlat3.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_1.x = texture(_T_VFX_RankBadge_HexMask, u_xlat1.xy).x;
    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat2 = u_xlat0.yzwx * u_xlat1.xxxx;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_3.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _brightness;
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
UNITY_LOCATION(4) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
bool u_xlatb4;
float u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1.x = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat9 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat9 * u_xlat1.x + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat9 * u_xlat6;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb4 ? u_xlat1.x : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb3 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat3.x = (u_xlatb3) ? (-u_xlat6) : u_xlat6;
    u_xlat3.x = u_xlat3.x * 0.159154937;
    u_xlat1.x = fract(u_xlat3.x);
    u_xlat3.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_7.xy = texture(_Sampler6053, u_xlat3.xy).xy;
    u_xlat16_3.xy = texture(_Sampler6054, u_xlat3.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat7.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_7.xy;
    u_xlat3.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_3.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat7.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_1.xyz) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.x = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xxx;
    u_xlat1.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Min, _Min, _Min)));
    u_xlat16_1.xyz = texture(_TextureSample0, u_xlat1.xy).xyz;
    u_xlat9 = (-_Min) + 1.0;
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
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(0.546097577, 0.380348802, 0.387558699) + vec3(0.138142705, 0.554101586, 0.591114223);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_brightness);
    u_xlat0.yzw = u_xlat3.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_1.x = texture(_T_VFX_RankBadge_HexMask, u_xlat1.xy).x;
    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat2 = u_xlat0.yzwx * u_xlat1.xxxx;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
  ZWrite Off
  Cull Off
  GpuProgramID 128364
Program "vp" {
SubProgram "gles3 " {
Keywords { "POINT" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
bool u_xlatb3;
float u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<(-u_xlat6));
#else
    u_xlatb6 = u_xlat6<(-u_xlat6);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2.x = u_xlat2.x * 0.159154937;
    u_xlat1.x = fract(u_xlat2.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_Sampler6053, u_xlat2.xy).xy;
    u_xlat16_2.xy = texture(_Sampler6054, u_xlat2.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat5.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_5.xy;
    u_xlat2.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_2.xy;
    u_xlat16_2.x = texture(_Texture0, u_xlat2.xy).x;
    u_xlat16_4 = texture(_Texture0, u_xlat5.xy).x;
    u_xlat2.x = (-u_xlat16_4) * u_xlat16_2.x + 1.0;
    u_xlat4 = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat4) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Min);
    u_xlat2.x = (-_Min) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_2.x = texture(_T_VFX_RankBadge_HexMask, u_xlat2.xy).x;
    u_xlat2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
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
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
bool u_xlatb3;
float u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<(-u_xlat6));
#else
    u_xlatb6 = u_xlat6<(-u_xlat6);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2.x = u_xlat2.x * 0.159154937;
    u_xlat1.x = fract(u_xlat2.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_Sampler6053, u_xlat2.xy).xy;
    u_xlat16_2.xy = texture(_Sampler6054, u_xlat2.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat5.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_5.xy;
    u_xlat2.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_2.xy;
    u_xlat16_2.x = texture(_Texture0, u_xlat2.xy).x;
    u_xlat16_4 = texture(_Texture0, u_xlat5.xy).x;
    u_xlat2.x = (-u_xlat16_4) * u_xlat16_2.x + 1.0;
    u_xlat4 = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat4) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Min);
    u_xlat2.x = (-_Min) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_2.x = texture(_T_VFX_RankBadge_HexMask, u_xlat2.xy).x;
    u_xlat2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
bool u_xlatb3;
float u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<(-u_xlat6));
#else
    u_xlatb6 = u_xlat6<(-u_xlat6);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2.x = u_xlat2.x * 0.159154937;
    u_xlat1.x = fract(u_xlat2.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_Sampler6053, u_xlat2.xy).xy;
    u_xlat16_2.xy = texture(_Sampler6054, u_xlat2.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat5.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_5.xy;
    u_xlat2.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_2.xy;
    u_xlat16_2.x = texture(_Texture0, u_xlat2.xy).x;
    u_xlat16_4 = texture(_Texture0, u_xlat5.xy).x;
    u_xlat2.x = (-u_xlat16_4) * u_xlat16_2.x + 1.0;
    u_xlat4 = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat4) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Min);
    u_xlat2.x = (-_Min) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_2.x = texture(_T_VFX_RankBadge_HexMask, u_xlat2.xy).x;
    u_xlat2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
bool u_xlatb3;
float u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<(-u_xlat6));
#else
    u_xlatb6 = u_xlat6<(-u_xlat6);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2.x = u_xlat2.x * 0.159154937;
    u_xlat1.x = fract(u_xlat2.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_Sampler6053, u_xlat2.xy).xy;
    u_xlat16_2.xy = texture(_Sampler6054, u_xlat2.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat5.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_5.xy;
    u_xlat2.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_2.xy;
    u_xlat16_2.x = texture(_Texture0, u_xlat2.xy).x;
    u_xlat16_4 = texture(_Texture0, u_xlat5.xy).x;
    u_xlat2.x = (-u_xlat16_4) * u_xlat16_2.x + 1.0;
    u_xlat4 = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat4) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Min);
    u_xlat2.x = (-_Min) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_2.x = texture(_T_VFX_RankBadge_HexMask, u_xlat2.xy).x;
    u_xlat2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
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
uniform 	float _RadialGradientSmoothstepMin1;
uniform 	float _RadialGradientSmoothstepMax1;
uniform 	float _Min;
uniform 	float _opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _Sampler6053;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6054;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_RankBadge_HexMask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
bool u_xlatb3;
float u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<(-u_xlat6));
#else
    u_xlatb6 = u_xlat6<(-u_xlat6);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2.x = u_xlat2.x * 0.159154937;
    u_xlat1.x = fract(u_xlat2.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_Sampler6053, u_xlat2.xy).xy;
    u_xlat16_2.xy = texture(_Sampler6054, u_xlat2.xy).xy;
    u_xlat1.y = _Time.y * -0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_RadialGradientSmoothstepMin1);
    u_xlat5.xy = u_xlat1.xy * vec2(3.0, 0.5) + u_xlat16_5.xy;
    u_xlat2.xy = u_xlat1.xy * vec2(4.0, 0.25) + u_xlat16_2.xy;
    u_xlat16_2.x = texture(_Texture0, u_xlat2.xy).x;
    u_xlat16_4 = texture(_Texture0, u_xlat5.xy).x;
    u_xlat2.x = (-u_xlat16_4) * u_xlat16_2.x + 1.0;
    u_xlat4 = (-_RadialGradientSmoothstepMin1) + _RadialGradientSmoothstepMax1;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat4) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Min);
    u_xlat2.x = (-_Min) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _opacity;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5) + vec2(-0.252999991, -0.252999991);
    u_xlat16_2.x = texture(_T_VFX_RankBadge_HexMask, u_xlat2.xy).x;
    u_xlat2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}