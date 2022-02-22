//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Valentine" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_SecondTex ("Second (RGB)", 2D) = "white" { }
_T ("Amount", Range(0, 1)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58097
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _T;
uniform 	float _ValentineBorder;
uniform 	vec3 _ValentineColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
ivec2 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.x = _ValentineBorder * 0.00100000005 + _T;
    u_xlat4.x = u_xlat0.x * 1.60000002;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x!=0.0);
#else
    u_xlatb0 = u_xlat0.x!=0.0;
#endif
    u_xlat8.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.400000006);
    u_xlat1.xy = u_xlat8.xy / u_xlat4.xx;
    u_xlat1.xz = u_xlat1.xy * u_xlat1.xy;
    u_xlat4.x = u_xlat1.z * u_xlat1.y;
    u_xlat4.x = u_xlat4.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.z + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + -0.300000012;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat5 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat1.x<u_xlat4.x);
#else
    u_xlatb4 = u_xlat1.x<u_xlat4.x;
#endif
    u_xlati0.x = int(uint((uint(u_xlatb4) * 0xffffffffu) & (uint(u_xlatb0) * 0xffffffffu)));
    u_xlat4.x = _T * 1.60000002;
    u_xlat4.xy = u_xlat8.xy / u_xlat4.xx;
    u_xlat4.xz = u_xlat4.xy * u_xlat4.xy;
    u_xlat8.x = u_xlat4.z * u_xlat4.y;
    u_xlat8.x = u_xlat8.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.z + u_xlat4.x;
    u_xlat4.x = u_xlat4.x + -0.300000012;
    u_xlat12 = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat12 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x<u_xlat8.x);
#else
    u_xlatb4 = u_xlat4.x<u_xlat8.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_T!=0.0);
#else
    u_xlatb8 = _T!=0.0;
#endif
    u_xlati0.y = int(uint((uint(u_xlatb4) * 0xffffffffu) & (uint(u_xlatb8) * 0xffffffffu)));
    u_xlat8.x = (u_xlati0.y != 0) ? -1.0 : -0.0;
    u_xlat0.xy = uintBitsToFloat(uvec2(uint(u_xlati0.x) & uint(1065353216u), uint(u_xlati0.y) & uint(1065353216u)));
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = u_xlat0.xxx * vec3(_ValentineColor.x, _ValentineColor.y, _ValentineColor.z);
    u_xlat16_2.xyz = texture(_SecondTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyw * u_xlat8.xxx + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "MODE_REVERSE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _T;
uniform 	float _ValentineBorder;
uniform 	vec3 _ValentineColor;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
ivec2 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.x = _ValentineBorder * 0.00100000005 + _T;
    u_xlat4.x = u_xlat0.x * 1.60000002;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x!=0.0);
#else
    u_xlatb0 = u_xlat0.x!=0.0;
#endif
    u_xlat8.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.400000006);
    u_xlat1.xy = u_xlat8.xy / u_xlat4.xx;
    u_xlat1.xz = u_xlat1.xy * u_xlat1.xy;
    u_xlat4.x = u_xlat1.z * u_xlat1.y;
    u_xlat4.x = u_xlat4.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.z + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + -0.300000012;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat5 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat1.x<u_xlat4.x);
#else
    u_xlatb4 = u_xlat1.x<u_xlat4.x;
#endif
    u_xlati0.x = int(uint((uint(u_xlatb4) * 0xffffffffu) & (uint(u_xlatb0) * 0xffffffffu)));
    u_xlat4.x = _T * 1.60000002;
    u_xlat4.xy = u_xlat8.xy / u_xlat4.xx;
    u_xlat4.xz = u_xlat4.xy * u_xlat4.xy;
    u_xlat8.x = u_xlat4.z * u_xlat4.y;
    u_xlat8.x = u_xlat8.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.z + u_xlat4.x;
    u_xlat4.x = u_xlat4.x + -0.300000012;
    u_xlat12 = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat12 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x<u_xlat8.x);
#else
    u_xlatb4 = u_xlat4.x<u_xlat8.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_T!=0.0);
#else
    u_xlatb8 = _T!=0.0;
#endif
    u_xlati0.y = int(uint((uint(u_xlatb4) * 0xffffffffu) & (uint(u_xlatb8) * 0xffffffffu)));
    u_xlat8.x = (u_xlati0.y != 0) ? -1.0 : -0.0;
    u_xlat0.xy = uintBitsToFloat(uvec2(uint(u_xlati0.x) & uint(1065353216u), uint(u_xlati0.y) & uint(1065353216u)));
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = u_xlat0.xxx * vec3(_ValentineColor.x, _ValentineColor.y, _ValentineColor.z);
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = texture(_SecondTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyw * u_xlat8.xxx + u_xlat1.xyz;
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
SubProgram "gles3 " {
Keywords { "MODE_REVERSE" }
""
}
}
}
}
Fallback "Transition Fallback"
}