//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/UI/VSScreen_Nova" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_T_VFX_Shared_Spectrum ("T_VFX_Shared_Spectrum", 2D) = "white" { }
_TextureSample1 ("Texture Sample 1", 2D) = "white" { }
_Brightness ("Brightness", Float) = 6
_Noise1 ("Noise 1", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 31380
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
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	float _Brightness;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler602;
UNITY_LOCATION(2) uniform mediump sampler2D _Noise1;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_Shared_Spectrum;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat6;
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
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat1.xy = _Time.yy * vec2(0.075000003, 0.0500000007) + u_xlat3.xx;
    u_xlat1.z = u_xlat0.x + (-_Time.y);
    u_xlat3.xy = u_xlat1.xz * vec2(1.0, 0.25);
    u_xlat16_3.xyz = texture(_TextureSample1, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz + vec3(-0.50999999, -0.50999999, -0.50999999);
    u_xlat3.xyz = u_xlat3.xyz * vec3(2.04081631, 2.04081631, 2.04081631);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat2.xyz;
    u_xlat1.xz = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_1.xz = texture(_Sampler602, u_xlat1.xz).xy;
    u_xlat1.w = _Time.y * -3.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.yw * vec2(2.0, 0.100000001) + u_xlat16_1.xz;
    u_xlat16_1.xyz = texture(_Noise1, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + vec3(-0.400000006, -0.400000006, -0.400000006);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.66666663, 1.66666663, 1.66666663);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat1.xyz + (-u_xlat3.xyz);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD0.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * 1.13;
    u_xlat5 = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat3.xyz = vec3(u_xlat5) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat3.yzx;
    u_xlat1.y = 0.0;
    u_xlat16_1.xyz = texture(_T_VFX_Shared_Spectrum, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.wxy * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    SV_Target0 = u_xlat0;
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
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	float _Brightness;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler602;
UNITY_LOCATION(2) uniform mediump sampler2D _Noise1;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_Shared_Spectrum;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat6;
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
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat1.xy = _Time.yy * vec2(0.075000003, 0.0500000007) + u_xlat3.xx;
    u_xlat1.z = u_xlat0.x + (-_Time.y);
    u_xlat3.xy = u_xlat1.xz * vec2(1.0, 0.25);
    u_xlat16_3.xyz = texture(_TextureSample1, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz + vec3(-0.50999999, -0.50999999, -0.50999999);
    u_xlat3.xyz = u_xlat3.xyz * vec3(2.04081631, 2.04081631, 2.04081631);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat2.xyz;
    u_xlat1.xz = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_1.xz = texture(_Sampler602, u_xlat1.xz).xy;
    u_xlat1.w = _Time.y * -3.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.yw * vec2(2.0, 0.100000001) + u_xlat16_1.xz;
    u_xlat16_1.xyz = texture(_Noise1, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + vec3(-0.400000006, -0.400000006, -0.400000006);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.66666663, 1.66666663, 1.66666663);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat1.xyz + (-u_xlat3.xyz);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD0.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * 1.13;
    u_xlat5 = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat3.xyz = vec3(u_xlat5) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat3.yzx;
    u_xlat1.y = 0.0;
    u_xlat16_1.xyz = texture(_T_VFX_Shared_Spectrum, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.wxy * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    SV_Target0 = u_xlat0;
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