//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Radial" {
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
  GpuProgramID 20597
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
uniform 	float _Clockwise;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = max(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5 = min(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5 * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(abs(u_xlat16_0.y)<abs(u_xlat16_0.x));
#else
    u_xlatb13 = abs(u_xlat16_0.y)<abs(u_xlat16_0.x);
#endif
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_0.y<(-u_xlat16_0.y));
#else
    u_xlatb5 = u_xlat16_0.y<(-u_xlat16_0.y);
#endif
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat5 = min(u_xlat16_0.y, u_xlat16_0.x);
    u_xlat9 = max(u_xlat16_0.y, u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
#else
    u_xlatb9 = u_xlat9>=(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5<(-u_xlat5));
#else
    u_xlatb5 = u_xlat5<(-u_xlat5);
#endif
    u_xlatb5 = u_xlatb9 && u_xlatb5;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat5 = u_xlat1.x * _Clockwise;
    u_xlat9 = _T * 7.85398197 + -3.92699075;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
    u_xlatb5 = u_xlat9<u_xlat5;
#endif
    u_xlat1.x = u_xlat1.x * _Clockwise + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = texture(_SecondTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat3.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + u_xlat3.xyz;
    SV_Target0.xyz = (bool(u_xlatb5)) ? u_xlat1.xzw : u_xlat3.xyz;
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
uniform 	float _Clockwise;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = max(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5 = min(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5 * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(abs(u_xlat16_0.y)<abs(u_xlat16_0.x));
#else
    u_xlatb13 = abs(u_xlat16_0.y)<abs(u_xlat16_0.x);
#endif
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_0.y<(-u_xlat16_0.y));
#else
    u_xlatb5 = u_xlat16_0.y<(-u_xlat16_0.y);
#endif
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat5 = min(u_xlat16_0.y, u_xlat16_0.x);
    u_xlat9 = max(u_xlat16_0.y, u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
#else
    u_xlatb9 = u_xlat9>=(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5<(-u_xlat5));
#else
    u_xlatb5 = u_xlat5<(-u_xlat5);
#endif
    u_xlatb5 = u_xlatb9 && u_xlatb5;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat5 = u_xlat1.x * _Clockwise;
    u_xlat9 = _T * 7.85398197 + -3.92699075;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
    u_xlatb5 = u_xlat9<u_xlat5;
#endif
    u_xlat1.x = u_xlat1.x * _Clockwise + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat16_2.xyz = texture(_SecondTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat3.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + u_xlat3.xyz;
    SV_Target0.xyz = (bool(u_xlatb5)) ? u_xlat1.xzw : u_xlat3.xyz;
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