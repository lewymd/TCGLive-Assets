//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Doom" {
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
  GpuProgramID 5844
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
uniform 	vec4 _ScreenParams;
uniform 	float _T;
uniform 	int _BarWidth;
uniform 	float _Amplitude;
uniform 	float _Noise;
uniform 	float _Frequency;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat1;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
    u_xlat6 = float(_BarWidth);
    u_xlat1 = u_xlat0.x / u_xlat6;
    u_xlat1 = trunc(u_xlat1);
    u_xlat3.x = u_xlat1 * _Frequency;
    u_xlat6 = u_xlat6 * u_xlat3.x;
    u_xlat3.xy = vec2(u_xlat6) * vec2(0.0500000007, 0.0129999993);
    u_xlat3.xy = cos(u_xlat3.xy);
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat6 = u_xlat6 * 0.100000001 + 10.0;
    u_xlat6 = u_xlat6 * 0.300000012;
    u_xlat6 = sin(u_xlat6);
    u_xlat6 = u_xlat6 * u_xlat3.x;
    u_xlat6 = u_xlat6 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Noise!=0.0);
#else
    u_xlatb3 = _Noise!=0.0;
#endif
    u_xlat1 = dot(vec2(u_xlat1), vec2(12.9898005, 78.2330017));
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = (-u_xlat6) + u_xlat1;
    u_xlat1 = _Noise * u_xlat1 + u_xlat6;
    u_xlat6 = (u_xlatb3) ? u_xlat1 : u_xlat6;
    u_xlat6 = u_xlat6 * _Amplitude + 1.0;
    u_xlat1 = u_xlat6 * _T;
    u_xlat6 = _T * u_xlat6 + vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<1.0);
#else
    u_xlatb6 = u_xlat6<1.0;
#endif
    if(u_xlatb6){
        u_xlat0.z = u_xlat1 * _ScreenParams.y + u_xlat0.y;
        u_xlat0.xy = u_xlat0.xz / _ScreenParams.xy;
        u_xlat0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    } else {
        u_xlat0.xyz = texture(_SecondTex, vs_TEXCOORD0.xy).xyz;
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ScreenParams;
uniform 	float _T;
uniform 	int _BarWidth;
uniform 	float _Amplitude;
uniform 	float _Noise;
uniform 	float _Frequency;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat1;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
    u_xlat6 = float(_BarWidth);
    u_xlat1 = u_xlat0.x / u_xlat6;
    u_xlat1 = trunc(u_xlat1);
    u_xlat3.x = u_xlat1 * _Frequency;
    u_xlat6 = u_xlat6 * u_xlat3.x;
    u_xlat3.xy = vec2(u_xlat6) * vec2(0.0500000007, 0.0129999993);
    u_xlat3.xy = cos(u_xlat3.xy);
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat6 = u_xlat6 * 0.100000001 + 10.0;
    u_xlat6 = u_xlat6 * 0.300000012;
    u_xlat6 = sin(u_xlat6);
    u_xlat6 = u_xlat6 * u_xlat3.x;
    u_xlat6 = u_xlat6 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Noise!=0.0);
#else
    u_xlatb3 = _Noise!=0.0;
#endif
    u_xlat1 = dot(vec2(u_xlat1), vec2(12.9898005, 78.2330017));
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = (-u_xlat6) + u_xlat1;
    u_xlat1 = _Noise * u_xlat1 + u_xlat6;
    u_xlat6 = (u_xlatb3) ? u_xlat1 : u_xlat6;
    u_xlat6 = u_xlat6 * _Amplitude + 1.0;
    u_xlat1 = u_xlat6 * _T;
    u_xlat6 = _T * u_xlat6 + vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<1.0);
#else
    u_xlatb6 = u_xlat6<1.0;
#endif
    if(u_xlatb6){
        u_xlat0.z = u_xlat1 * _ScreenParams.y + u_xlat0.y;
        u_xlat0.xy = u_xlat0.xz / _ScreenParams.xy;
        u_xlat0.xyz = texture(_SecondTex, u_xlat0.xy).xyz;
    } else {
        u_xlat0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    }
    SV_Target0.xyz = u_xlat0.xyz;
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