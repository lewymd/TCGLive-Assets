//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Page Curl NoShadows" {
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
  GpuProgramID 23860
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
uniform 	float _Radius;
uniform 	vec2 _Angle;
uniform 	int _Obtuse;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
float u_xlat14;
bool u_xlatb14;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat1.xy = (int(_Obtuse) != 0) ? u_xlat16_0.xy : vs_TEXCOORD0.xy;
    u_xlat13.xy = vec2(_T) * vec2(_Angle.x, _Angle.y);
    u_xlat2.x = _Radius * 4.0 + 1.0;
    u_xlat2.xy = u_xlat13.xy * u_xlat2.xx;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-_Radius) * 2.0 + u_xlat2.x;
    u_xlat8 = dot(u_xlat13.xy, u_xlat13.xy);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat13.xy = u_xlat13.xy * vec2(u_xlat8);
    u_xlat3.x = dot(u_xlat1.xy, u_xlat13.xy);
    u_xlat8 = u_xlat2.x + (-_Radius);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat3.x>=u_xlat8);
#else
    u_xlatb8 = u_xlat3.x>=u_xlat8;
#endif
    if(u_xlatb8){
        u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
        u_xlat1.xy = u_xlat1.xy / u_xlat13.xy;
        u_xlat1.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat1.x = u_xlat1.x + u_xlat3.x;
        u_xlat7 = u_xlat2.x + _Radius;
#ifdef UNITY_ADRENO_ES3
        u_xlatb7 = !!(u_xlat7<u_xlat3.x);
#else
        u_xlatb7 = u_xlat7<u_xlat3.x;
#endif
        u_xlat8 = (-u_xlat2.x) + u_xlat3.x;
        u_xlat8 = u_xlat8 / _Radius;
        u_xlat14 = -abs(u_xlat8) + 1.0;
        u_xlat14 = sqrt(u_xlat14);
        u_xlat20 = abs(u_xlat8) * -0.0187292993 + 0.0742610022;
        u_xlat20 = u_xlat20 * abs(u_xlat8) + -0.212114394;
        u_xlat20 = u_xlat20 * abs(u_xlat8) + 1.57072878;
        u_xlat21 = u_xlat14 * u_xlat20;
        u_xlat21 = u_xlat21 * -2.0 + 3.14159274;
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
        u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
        u_xlat8 = u_xlatb8 ? u_xlat21 : float(0.0);
        u_xlat8 = u_xlat20 * u_xlat14 + u_xlat8;
        u_xlat8 = (-u_xlat8) + 1.57079637;
        u_xlat14 = (-u_xlat8) + 3.14159274;
        u_xlat4.x = u_xlat14 * _Radius + u_xlat2.x;
        u_xlat4.y = cos(u_xlat14);
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat4.x<u_xlat1.x);
#else
        u_xlatb14 = u_xlat4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat3.x<u_xlat2.x);
#else
        u_xlatb20 = u_xlat3.x<u_xlat2.x;
#endif
        u_xlat5.x = u_xlat8 * _Radius + u_xlat2.x;
        u_xlat5.y = cos(u_xlat8);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(u_xlat5.x<u_xlat1.x);
#else
        u_xlatb1.x = u_xlat5.x<u_xlat1.x;
#endif
        u_xlat2.xy = (u_xlatb1.x) ? u_xlat5.xy : vec2(-1.0, -1.0);
        u_xlat3.y = 1.0;
        u_xlat2.xy = (bool(u_xlatb20)) ? u_xlat3.xy : u_xlat2.xy;
        u_xlat2.xy = (bool(u_xlatb14)) ? u_xlat4.xy : u_xlat2.xy;
        u_xlat1.xy = (bool(u_xlatb7)) ? vec2(-1.0, -1.0) : u_xlat2.xy;
    } else {
        u_xlat3.z = 1.0;
        u_xlat1.xy = u_xlat3.xz;
    }
    u_xlat2.x = (-u_xlat3.x) + u_xlat1.x;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
    u_xlat2.xyz = texture(_SecondTex, u_xlat13.xy).xyz;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.yxyy).xy;
    u_xlat3.xyz = u_xlat2.xyz * vec3(0.25, 0.25, 0.25) + vec3(0.75, 0.75, 0.75);
    u_xlat1.xzw = (u_xlatb1.x) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat2.xyz;
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
uniform 	float _Radius;
uniform 	vec2 _Angle;
uniform 	int _Obtuse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
float u_xlat14;
bool u_xlatb14;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat1.xy = (int(_Obtuse) != 0) ? u_xlat16_0.xy : vs_TEXCOORD0.xy;
    u_xlat13.xy = vec2(_T) * vec2(_Angle.x, _Angle.y);
    u_xlat2.x = _Radius * 4.0 + 1.0;
    u_xlat2.xy = u_xlat13.xy * u_xlat2.xx;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-_Radius) * 2.0 + u_xlat2.x;
    u_xlat8 = dot(u_xlat13.xy, u_xlat13.xy);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat13.xy = u_xlat13.xy * vec2(u_xlat8);
    u_xlat3.x = dot(u_xlat1.xy, u_xlat13.xy);
    u_xlat8 = u_xlat2.x + (-_Radius);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat3.x>=u_xlat8);
#else
    u_xlatb8 = u_xlat3.x>=u_xlat8;
#endif
    if(u_xlatb8){
        u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
        u_xlat1.xy = u_xlat1.xy / u_xlat13.xy;
        u_xlat1.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat1.x = u_xlat1.x + u_xlat3.x;
        u_xlat7 = u_xlat2.x + _Radius;
#ifdef UNITY_ADRENO_ES3
        u_xlatb7 = !!(u_xlat7<u_xlat3.x);
#else
        u_xlatb7 = u_xlat7<u_xlat3.x;
#endif
        u_xlat8 = (-u_xlat2.x) + u_xlat3.x;
        u_xlat8 = u_xlat8 / _Radius;
        u_xlat14 = -abs(u_xlat8) + 1.0;
        u_xlat14 = sqrt(u_xlat14);
        u_xlat20 = abs(u_xlat8) * -0.0187292993 + 0.0742610022;
        u_xlat20 = u_xlat20 * abs(u_xlat8) + -0.212114394;
        u_xlat20 = u_xlat20 * abs(u_xlat8) + 1.57072878;
        u_xlat21 = u_xlat14 * u_xlat20;
        u_xlat21 = u_xlat21 * -2.0 + 3.14159274;
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
        u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
        u_xlat8 = u_xlatb8 ? u_xlat21 : float(0.0);
        u_xlat8 = u_xlat20 * u_xlat14 + u_xlat8;
        u_xlat8 = (-u_xlat8) + 1.57079637;
        u_xlat14 = (-u_xlat8) + 3.14159274;
        u_xlat4.x = u_xlat14 * _Radius + u_xlat2.x;
        u_xlat4.y = cos(u_xlat14);
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat4.x<u_xlat1.x);
#else
        u_xlatb14 = u_xlat4.x<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat3.x<u_xlat2.x);
#else
        u_xlatb20 = u_xlat3.x<u_xlat2.x;
#endif
        u_xlat5.x = u_xlat8 * _Radius + u_xlat2.x;
        u_xlat5.y = cos(u_xlat8);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(u_xlat5.x<u_xlat1.x);
#else
        u_xlatb1.x = u_xlat5.x<u_xlat1.x;
#endif
        u_xlat2.xy = (u_xlatb1.x) ? u_xlat5.xy : vec2(-1.0, -1.0);
        u_xlat3.y = 1.0;
        u_xlat2.xy = (bool(u_xlatb20)) ? u_xlat3.xy : u_xlat2.xy;
        u_xlat2.xy = (bool(u_xlatb14)) ? u_xlat4.xy : u_xlat2.xy;
        u_xlat1.xy = (bool(u_xlatb7)) ? vec2(-1.0, -1.0) : u_xlat2.xy;
    } else {
        u_xlat3.z = 1.0;
        u_xlat1.xy = u_xlat3.xz;
    }
    u_xlat2.x = (-u_xlat3.x) + u_xlat1.x;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
    u_xlat2.xyz = texture(_MainTex, u_xlat13.xy).xyz;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.yxyy).xy;
    u_xlat3.xyz = u_xlat2.xyz * vec3(0.25, 0.25, 0.25) + vec3(0.75, 0.75, 0.75);
    u_xlat1.xzw = (u_xlatb1.x) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = texture(_SecondTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat2.xyz;
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