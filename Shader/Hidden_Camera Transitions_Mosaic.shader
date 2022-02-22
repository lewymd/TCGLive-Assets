//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Mosaic" {
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
  GpuProgramID 23604
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
uniform 	int _StepX;
uniform 	int _StepY;
uniform 	int _Rotate;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
vec3 u_xlat2;
ivec2 u_xlati2;
bvec2 u_xlatb2;
vec2 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
vec2 u_xlat7;
vec2 u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat19;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _T * 2.0 + -1.0;
    u_xlat1.x = dot(u_xlat1.xx, u_xlat1.xx);
    u_xlat1.x = (-u_xlat1.x) + 3.0;
    u_xlat7.xy = vec2(ivec2(_StepX, _StepY));
    u_xlat19 = _T * _T;
    u_xlat7.xy = u_xlat7.xy * vec2(u_xlat19);
    u_xlat1.xy = u_xlat16_0.xy * abs(u_xlat1.xx) + u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat13.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
    u_xlati2.xy = ivec2(u_xlat13.xy);
    u_xlatb2.xy = equal(u_xlati2.xyxx, ivec4(_StepX, _StepY, _StepX, _StepX)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.xy = equal((ivec4(u_xlatb2.xxxx) * int(0xffffffffu)), ivec4(0, int(0xFFFFFFFFu), 0, 0)).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_Rotate==1);
#else
    u_xlatb14 = _Rotate==1;
#endif
    u_xlatb2.x = u_xlatb14 && u_xlatb2.x;
    u_xlat13.x = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat13.x = u_xlat13.x * 43758.5469;
    u_xlat13.x = fract(u_xlat13.x);
    u_xlat19 = u_xlat13.x * 4.0;
    u_xlat19 = trunc(u_xlat19);
    u_xlat19 = u_xlat19 * 1.57079637;
    u_xlat14.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat3.x = sin(u_xlat19);
    u_xlat4 = cos(u_xlat19);
    u_xlat5.x = sin((-u_xlat19));
    u_xlat5.y = u_xlat4;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat14.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = (u_xlatb2.x) ? u_xlat14.xy : u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<u_xlat13.x);
#else
    u_xlatb13 = 0.5<u_xlat13.x;
#endif
    u_xlatb13 = u_xlatb13 || u_xlatb2.y;
    if(u_xlatb13){
        u_xlat2.xyz = texture(_SecondTex, u_xlat1.xy).xyz;
    } else {
        u_xlat2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    }
    SV_Target0.xyz = u_xlat2.xyz;
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