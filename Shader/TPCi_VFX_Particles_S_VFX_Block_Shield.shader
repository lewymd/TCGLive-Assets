//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/S_VFX_Block_Shield" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_ShieldTexture ("Shield Texture", 2D) = "white" { }
_RefractionTexture ("Refraction Texture", 2D) = "bump" { }
_GlitchTearingMask ("Glitch Tearing Mask", 2D) = "white" { }
_Aberration ("Aberration", Float) = 4
_Opacity ("Opacity", Range(0, 1)) = 0
_distortion ("distortion", Range(0, 0.15)) = 0.05
_brightness ("brightness", Float) = 1
_OffsetG ("Offset G", Vector) = (0,0,0,0)
_OffsetR ("Offset R", Vector) = (0,0,0,0)
_OffsetB ("Offset B", Vector) = (0,0,0,0)
_OffsetA ("Offset A", Vector) = (0,0,0,0)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 4285
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ProjectionParams;
uniform 	float _distortion;
uniform 	float _Aberration;
uniform 	vec2 _OffsetR;
uniform 	vec2 _OffsetG;
uniform 	vec2 _OffsetB;
uniform 	vec2 _OffsetA;
uniform 	float _brightness;
uniform 	float _Opacity;
UNITY_LOCATION(0) uniform mediump sampler2D _GlitchTearingMask;
UNITY_LOCATION(1) uniform mediump sampler2D _ShieldTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat6;
mediump vec2 u_xlat16_6;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.w * 0.5;
    u_xlat5 = (-vs_TEXCOORD3.w) * 0.5 + vs_TEXCOORD3.y;
    u_xlat0.y = u_xlat5 * _ProjectionParams.x + u_xlat0.x;
    u_xlat0.xz = vs_TEXCOORD3.xw;
    u_xlat0.xyz = u_xlat0.xyz / vs_TEXCOORD3.www;
    u_xlat15 = vs_TEXCOORD0.w * _distortion;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 12.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(0.00100000005, 0.119999997);
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.0199999996) + u_xlat1.xy;
    u_xlat16_1 = texture(_GlitchTearingMask, u_xlat1.xy).x;
    u_xlat6.x = max(vs_TEXCOORD0.z, -0.119999997);
    u_xlat6.x = min(u_xlat6.x, 0.119999997);
    u_xlat2.x = u_xlat6.x * u_xlat16_1;
    u_xlat1.x = u_xlat6.x * _Aberration;
    u_xlat2.y = 0.0;
    u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat16_6.xy = texture(_RefractionTexture, u_xlat6.xy).xy;
    u_xlat16_3.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.xy = vec2(u_xlat15) * u_xlat16_3.xy;
    u_xlat3 = u_xlat1.xxxx * vec4(_OffsetB.x, _OffsetB.y, _OffsetA.x, _OffsetA.y) + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * vec4(_OffsetR.x, _OffsetR.y, _OffsetG.x, _OffsetG.y) + u_xlat2.xyxy;
    u_xlat2 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat3 + vs_TEXCOORD0.xyxy;
    u_xlat16_15 = texture(_ShieldTexture, u_xlat3.zw).w;
    u_xlat4.z = texture(_ShieldTexture, u_xlat3.xy).z;
    u_xlat0.xy = u_xlat6.xy * vec2(u_xlat16_15) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat4.y = texture(_ShieldTexture, u_xlat2.zw).y;
    u_xlat4.x = texture(_ShieldTexture, u_xlat2.xy).x;
    u_xlat15 = u_xlat16_15 + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * _Opacity;
    u_xlat1.w = u_xlat15 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat4.xyz * vec3(_brightness) + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xyz + vs_COLOR0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
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
    u_xlat1.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD2.xyw = u_xlat1.xyw;
    vs_TEXCOORD3 = u_xlat1;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	float _distortion;
uniform 	float _Aberration;
uniform 	vec2 _OffsetR;
uniform 	vec2 _OffsetG;
uniform 	vec2 _OffsetB;
uniform 	vec2 _OffsetA;
uniform 	float _brightness;
uniform 	float _Opacity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GlitchTearingMask;
UNITY_LOCATION(2) uniform mediump sampler2D _ShieldTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _GrabTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat6;
mediump vec2 u_xlat16_6;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.w * 0.5;
    u_xlat5 = (-vs_TEXCOORD3.w) * 0.5 + vs_TEXCOORD3.y;
    u_xlat0.y = u_xlat5 * _ProjectionParams.x + u_xlat0.x;
    u_xlat0.xz = vs_TEXCOORD3.xw;
    u_xlat0.xyz = u_xlat0.xyz / vs_TEXCOORD3.www;
    u_xlat15 = vs_TEXCOORD0.w * _distortion;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 12.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(0.00100000005, 0.119999997);
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.0199999996) + u_xlat1.xy;
    u_xlat16_1 = texture(_GlitchTearingMask, u_xlat1.xy).x;
    u_xlat6.x = max(vs_TEXCOORD0.z, -0.119999997);
    u_xlat6.x = min(u_xlat6.x, 0.119999997);
    u_xlat2.x = u_xlat6.x * u_xlat16_1;
    u_xlat1.x = u_xlat6.x * _Aberration;
    u_xlat2.y = 0.0;
    u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat16_6.xy = texture(_RefractionTexture, u_xlat6.xy).xy;
    u_xlat16_3.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.xy = vec2(u_xlat15) * u_xlat16_3.xy;
    u_xlat3 = u_xlat1.xxxx * vec4(_OffsetB.x, _OffsetB.y, _OffsetA.x, _OffsetA.y) + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * vec4(_OffsetR.x, _OffsetR.y, _OffsetG.x, _OffsetG.y) + u_xlat2.xyxy;
    u_xlat2 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat3 + vs_TEXCOORD0.xyxy;
    u_xlat16_15 = texture(_ShieldTexture, u_xlat3.zw).w;
    u_xlat4.z = texture(_ShieldTexture, u_xlat3.xy).z;
    u_xlat0.xy = u_xlat6.xy * vec2(u_xlat16_15) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat4.y = texture(_ShieldTexture, u_xlat2.zw).y;
    u_xlat4.x = texture(_ShieldTexture, u_xlat2.xy).x;
    u_xlat15 = u_xlat16_15 + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * _Opacity;
    u_xlat0.xyz = u_xlat4.xyz * vec3(_brightness) + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat1.w = u_xlat15 * u_xlat0.x;
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
Keywords { "SOFTPARTICLES_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}