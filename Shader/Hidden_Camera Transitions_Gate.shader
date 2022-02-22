//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Gate" {
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
  GpuProgramID 40102
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
uniform 	float _GatePerspective;
uniform 	float _GateDepth;
uniform 	float _GateReflection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bvec2 u_xlatb5;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD0.xxy + vec3(-0.5, -0.5, -0.5);
    u_xlat1.x = abs(u_xlat16_0.x) * 2.0 + (-_T);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<u_xlat1.x);
#else
    u_xlatb4 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<vs_TEXCOORD0.x);
#else
    u_xlatb7 = 0.5<vs_TEXCOORD0.x;
#endif
    u_xlat7.x = (u_xlatb7) ? -1.0 : 1.0;
    u_xlat7.x = u_xlat7.x * _T;
    u_xlat2.x = u_xlat7.x * 0.5;
    u_xlat2.y = 0.0;
    u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat7.x = _T * _GatePerspective;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat7.x * u_xlat1.x + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat1.x * 0.5;
    u_xlat10 = (-u_xlat1.x) * 0.5 + u_xlat2.y;
    u_xlat2.z = u_xlat10 * u_xlat1.x + u_xlat7.x;
    u_xlat1.xy = (bool(u_xlatb4)) ? u_xlat2.xz : vec2(-1.0, -1.0);
    u_xlat7.x = (-_T) + 1.0;
    u_xlat10 = _GateDepth + -1.0;
    u_xlat7.x = u_xlat7.x * u_xlat10 + 1.0;
    u_xlat7.xy = u_xlat16_0.yz * u_xlat7.xx + vec2(0.5, 0.5);
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb5.xy = lessThan(u_xlat1.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb2.x = u_xlatb5.x && u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
        SV_Target0.xyz = u_xlat16_2.xyz;
        SV_Target0.w = 1.0;
        return;
    } else {
        u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb2.xy = lessThan(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlatb4 = u_xlatb2.y && u_xlatb2.x;
        u_xlatb1.x = u_xlatb4 && u_xlatb1.x;
        if(u_xlatb1.x){
            u_xlat16_2.xyz = texture(_SecondTex, u_xlat7.xy).xyz;
            SV_Target0.xyz = u_xlat16_2.xyz;
            SV_Target0.w = 1.0;
            return;
        }
    }
    u_xlat1.x = u_xlat7.x * 1.0;
    u_xlat1.z = u_xlat7.y * -1.20000005 + -0.0199999996;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xzxx).xy;
    u_xlatb4 = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.xy = lessThan(u_xlat1.xzxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb4 = u_xlatb4 && u_xlatb2.x;
    if(u_xlatb4){
        u_xlat4 = u_xlat7.y * -1.20000005 + -0.0199999996;
        u_xlat16_1.xzw = texture(_SecondTex, u_xlat1.xz).xyz;
        u_xlat4 = (-u_xlat4) + 1.0;
        u_xlat4 = u_xlat4 * _GateReflection;
        u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat4);
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _GatePerspective;
uniform 	float _GateDepth;
uniform 	float _GateReflection;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bvec2 u_xlatb5;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD0.xxy + vec3(-0.5, -0.5, -0.5);
    u_xlat1.x = abs(u_xlat16_0.x) * 2.0 + (-_T);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<u_xlat1.x);
#else
    u_xlatb4 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<vs_TEXCOORD0.x);
#else
    u_xlatb7 = 0.5<vs_TEXCOORD0.x;
#endif
    u_xlat7.x = (u_xlatb7) ? -1.0 : 1.0;
    u_xlat7.x = u_xlat7.x * _T;
    u_xlat2.x = u_xlat7.x * 0.5;
    u_xlat2.y = 0.0;
    u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat7.x = _T * _GatePerspective;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat7.x * u_xlat1.x + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat1.x * 0.5;
    u_xlat10 = (-u_xlat1.x) * 0.5 + u_xlat2.y;
    u_xlat2.z = u_xlat10 * u_xlat1.x + u_xlat7.x;
    u_xlat1.xy = (bool(u_xlatb4)) ? u_xlat2.xz : vec2(-1.0, -1.0);
    u_xlat7.x = (-_T) + 1.0;
    u_xlat10 = _GateDepth + -1.0;
    u_xlat7.x = u_xlat7.x * u_xlat10 + 1.0;
    u_xlat7.xy = u_xlat16_0.yz * u_xlat7.xx + vec2(0.5, 0.5);
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb5.xy = lessThan(u_xlat1.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb2.x = u_xlatb5.x && u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat16_2.xyz = texture(_SecondTex, u_xlat1.xy).xyz;
        SV_Target0.xyz = u_xlat16_2.xyz;
        SV_Target0.w = 1.0;
        return;
    } else {
        u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb2.xy = lessThan(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlatb4 = u_xlatb2.y && u_xlatb2.x;
        u_xlatb1.x = u_xlatb4 && u_xlatb1.x;
        if(u_xlatb1.x){
            u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
            SV_Target0.xyz = u_xlat16_2.xyz;
            SV_Target0.w = 1.0;
            return;
        }
    }
    u_xlat1.x = u_xlat7.x * 1.0;
    u_xlat1.z = u_xlat7.y * -1.20000005 + -0.0199999996;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xzxx).xy;
    u_xlatb4 = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.xy = lessThan(u_xlat1.xzxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb4 = u_xlatb4 && u_xlatb2.x;
    if(u_xlatb4){
        u_xlat4 = u_xlat7.y * -1.20000005 + -0.0199999996;
        u_xlat16_1.xzw = texture(_MainTex, u_xlat1.xz).xyz;
        u_xlat4 = (-u_xlat4) + 1.0;
        u_xlat4 = u_xlat4 * _GateReflection;
        u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat4);
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz;
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