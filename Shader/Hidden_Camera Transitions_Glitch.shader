//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Glitch" {
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
  GpuProgramID 44484
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
uniform 	float _GlitchStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat8;
vec2 u_xlat9;
float u_xlat12;
void main()
{
    u_xlat0.xy = vec2(_T) * vec2(1200.0, 3500.0);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.015625, 0.015625);
    u_xlat8.xy = _ScreenParams.xy * vec2(0.0625, 0.0625);
    u_xlat8.xy = floor(u_xlat8.xy);
    u_xlat0.xy = u_xlat8.xy * vec2(0.015625, 0.015625) + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_GlitchStrength);
    u_xlat8.x = _T;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat1.x = (-u_xlat12) * u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat8.x * u_xlat12;
    u_xlat12 = sin(u_xlat1.x);
    u_xlat1.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat9.xy = u_xlat1.xy * vec2(0.125, 0.125) + vs_TEXCOORD0.xy;
    u_xlat2 = u_xlat1.xyxy * vec4(0.100000001, 0.100000001, 0.200000003, 0.200000003) + vs_TEXCOORD0.xyxy;
    u_xlat1.z = texture(_SecondTex, u_xlat9.xy).z;
    u_xlat1.x = texture(_SecondTex, u_xlat2.xy).x;
    u_xlat1.y = texture(_SecondTex, u_xlat2.zw).y;
    u_xlat12 = sin(u_xlat8.x);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(0.125, 0.125) + vs_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.xyxy * vec4(0.100000001, 0.100000001, 0.200000003, 0.200000003) + vs_TEXCOORD0.xyxy;
    u_xlat0.w = texture(_MainTex, u_xlat2.xy).z;
    u_xlat0.x = texture(_MainTex, u_xlat3.xy).x;
    u_xlat0.y = texture(_MainTex, u_xlat3.zw).y;
    u_xlat1.xyz = (-u_xlat0.xyw) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat0.xyw;
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
Fallback "Transition Fallback"
}