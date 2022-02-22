//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Cross Zoom" {
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
  GpuProgramID 47768
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
uniform 	float _Strength;
uniform 	float _Quality;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
vec2 u_xlat1;
float u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat5;
bvec2 u_xlatb5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat12;
bool u_xlatb12;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat0 = _T * 6.28318548;
    u_xlatb5.xy = equal(vec4(_T), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat15 = (u_xlatb5.x) ? 0.0 : 1.0;
    u_xlatb5.x = u_xlatb5.y || u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(_T<0.5);
#else
    u_xlatb10 = _T<0.5;
#endif
    u_xlat1.x = _T * 2.0 + -1.0;
    u_xlat1.xy = u_xlat1.xx * vec2(10.0, -10.0);
    u_xlat1.xy = exp2(u_xlat1.xy);
    u_xlat1.y = (-u_xlat1.y) + 2.0;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat10.x = (u_xlatb10) ? u_xlat1.x : u_xlat1.y;
    u_xlat5 = (u_xlatb5.x) ? u_xlat15 : u_xlat10.x;
    u_xlat10.x = _Strength * -0.5;
    u_xlat0 = cos(u_xlat0);
    u_xlat0 = u_xlat0 + -1.0;
    u_xlat0 = u_xlat0 * u_xlat10.x;
    u_xlat1.x = _T * 0.5 + 0.25;
    u_xlat1.y = 0.5;
    u_xlat10.xy = u_xlat1.xy + (-vs_TEXCOORD0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat6.x = float(0.0);
    u_xlat6.y = float(0.0);
    u_xlat6.z = float(0.0);
    u_xlat2 = float(0.0);
    u_xlat7 = float(0.0);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(_Quality<u_xlat7);
#else
        u_xlatb12 = _Quality<u_xlat7;
#endif
        if(u_xlatb12){break;}
        u_xlat12 = u_xlat1.x + u_xlat7;
        u_xlat12 = u_xlat12 / _Quality;
        u_xlat17 = (-u_xlat12) * u_xlat12 + u_xlat12;
        u_xlat3 = u_xlat17 * 4.0;
        u_xlat8.xy = u_xlat10.xy * vec2(u_xlat12);
        u_xlat8.xy = u_xlat8.xy * vec2(u_xlat0) + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat8.xy).xyz;
        u_xlat16_8.xyz = texture(_SecondTex, u_xlat8.xy).xyz;
        u_xlat8.xyz = (-u_xlat16_4.xyz) + u_xlat16_8.xyz;
        u_xlat8.xyz = vec3(u_xlat5) * u_xlat8.xyz + u_xlat16_4.xyz;
        u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat3) + u_xlat6.xyz;
        u_xlat2 = u_xlat17 * 4.0 + u_xlat2;
        u_xlat7 = u_xlat7 + 1.0;
    }
    SV_Target0.xyz = u_xlat6.xyz / vec3(u_xlat2);
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
uniform 	float _Strength;
uniform 	float _Quality;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
vec2 u_xlat1;
float u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat5;
bvec2 u_xlatb5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat12;
bool u_xlatb12;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat0 = _T * 6.28318548;
    u_xlatb5.xy = equal(vec4(_T), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat15 = (u_xlatb5.x) ? 0.0 : 1.0;
    u_xlatb5.x = u_xlatb5.y || u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(_T<0.5);
#else
    u_xlatb10 = _T<0.5;
#endif
    u_xlat1.x = _T * 2.0 + -1.0;
    u_xlat1.xy = u_xlat1.xx * vec2(10.0, -10.0);
    u_xlat1.xy = exp2(u_xlat1.xy);
    u_xlat1.y = (-u_xlat1.y) + 2.0;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat10.x = (u_xlatb10) ? u_xlat1.x : u_xlat1.y;
    u_xlat5 = (u_xlatb5.x) ? u_xlat15 : u_xlat10.x;
    u_xlat10.x = _Strength * -0.5;
    u_xlat0 = cos(u_xlat0);
    u_xlat0 = u_xlat0 + -1.0;
    u_xlat0 = u_xlat0 * u_xlat10.x;
    u_xlat1.x = _T * 0.5 + 0.25;
    u_xlat1.y = 0.5;
    u_xlat10.xy = u_xlat1.xy + (-vs_TEXCOORD0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat6.x = float(0.0);
    u_xlat6.y = float(0.0);
    u_xlat6.z = float(0.0);
    u_xlat2 = float(0.0);
    u_xlat7 = float(0.0);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(_Quality<u_xlat7);
#else
        u_xlatb12 = _Quality<u_xlat7;
#endif
        if(u_xlatb12){break;}
        u_xlat12 = u_xlat1.x + u_xlat7;
        u_xlat12 = u_xlat12 / _Quality;
        u_xlat17 = (-u_xlat12) * u_xlat12 + u_xlat12;
        u_xlat3 = u_xlat17 * 4.0;
        u_xlat8.xy = u_xlat10.xy * vec2(u_xlat12);
        u_xlat8.xy = u_xlat8.xy * vec2(u_xlat0) + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SecondTex, u_xlat8.xy).xyz;
        u_xlat16_8.xyz = texture(_MainTex, u_xlat8.xy).xyz;
        u_xlat8.xyz = (-u_xlat16_4.xyz) + u_xlat16_8.xyz;
        u_xlat8.xyz = vec3(u_xlat5) * u_xlat8.xyz + u_xlat16_4.xyz;
        u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat3) + u_xlat6.xyz;
        u_xlat2 = u_xlat17 * 4.0 + u_xlat2;
        u_xlat7 = u_xlat7 + 1.0;
    }
    SV_Target0.xyz = u_xlat6.xyz / vec3(u_xlat2);
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