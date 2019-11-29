// TODO : refactor in header
#ifdef USE_PBR_UNI
#define USE_PBR
#elif defined(USE_PBR_MAP)
#define USE_PBR
#endif

#ifdef USE_PBR
#define USE_NORMAL
#elif defined(USE_NORMAL_VTX)
#define USE_NORMAL
#elif defined(USE_NORMAL_MAP)
#define USE_NORMAL
#endif

#ifdef USE_COLOR_MAP
#define USE_TEXCOORD
#elif defined(USE_NORMAL_MAP)
#define USE_TEXCOORD
#elif defined(USE_PBR_MAP)
#define USE_TEXCOORD
#elif defined(USE_EMISSIVE_MAP)
#define USE_TEXCOORD
#elif defined(USE_OCCLUSION_MAP)
#define USE_TEXCOORD
#endif

#ifdef USE_NORMAL
#ifndef USE_TANGENT_VTX
#ifndef USE_TEXCOORD
#define USE_TEXCOORD
#endif
#endif
#endif

#ifdef USE_SKIN
#define USE_WEIGHT
#define USE_JOINT
#endif

// uniforms
#ifdef USE_TRANSFORM
uniform mat4 u_m44World;
uniform mat4 u_m44View;
uniform mat4 u_m44Projection;
uniform mat4 u_m44WorldInverse;
#endif

#ifdef USE_PARTICLE
uniform vec4 u_v4Particle;
#endif

#ifdef USE_SKIN
uniform mat4 u_m44Skeleton[64];
#endif

// attributes
/*layout(location = 0)*/ in vec3 i_v3Position;

#ifdef USE_NORMAL
/*layout(location = 1)*/ in vec3 i_v3Normal;
#endif

#ifdef USE_COLOR_VTX
/*layout(location = 2)*/ in vec4 i_v4Color;
#endif

#ifdef USE_TEXCOORD
/*layout(location = 3)*/ in vec2 i_v2Texcoord;
#endif

#ifdef USE_TANGENT_VTX
/*layout(location = 4)*/ in vec4 i_v4Tangent;
#endif

#ifdef USE_WEIGHT
/*layout(location = 5)*/ in vec4 i_v4Weight;
#endif

#ifdef USE_JOINT
/*layout(location = 6)*/ in vec4 i_v4Joint;
#endif

#ifdef USE_PARTICLE
/*layout(location =  7)*/ in vec3 i_v3Velocity;
/*layout(location =  8)*/ in vec4 i_v4Orientation;
/*layout(location =  9)*/ in vec4 i_v4AngularVelocity;
/*layout(location = 10)*/ in vec3 i_v3Scale;
/*layout(location = 11)*/ in vec3 i_v3ScaleVelocity;
/*layout(location = 12)*/ in vec4 i_v4Particle;
#endif
#
// varyings
out vec3 v_v3Position;

#ifdef USE_NORMAL
#ifdef USE_TANGENT_VTX
out mat3 v_m3Tbn;
#else
out vec3 v_v3Normal;
#endif
#endif

#ifdef USE_COLOR_VTX
out vec4 v_v4Color;
#endif

#ifdef USE_TEXCOORD
out vec2 v_v2Texcoord;
#endif

#if DEBUG_SKIN
#ifdef USE_WEIGHT
out vec4 v_v4Weight;
#endif

#ifdef USE_JOINT
out vec4 v_v4Joint;
#endif
#endif

#ifdef USE_PARTICLE
/*out vec3 v_v3Velocity;
out vec3 v_v4Orientation;
out vec3 v_v4AngularVelocity;
out vec3 v_v3Scale;
out vec3 v_v3ScaleVelocity;*/
out vec4 v_v4Particle;
#endif

out vec2 v_v2Screen;
out vec4 v_v4Distance;

void main()
{

#ifdef USE_SKIN
#if DEBUG_SKIN
	v_v4Weight = i_v4Weight;
	v_v4Joint = i_v4Joint;
#endif
	mat4 m44Skin =
		i_v4Weight.x * u_m44Skeleton[int(i_v4Joint.x)] +
		i_v4Weight.y * u_m44Skeleton[int(i_v4Joint.y)] +
		i_v4Weight.z * u_m44Skeleton[int(i_v4Joint.z)] +
		i_v4Weight.w * u_m44Skeleton[int(i_v4Joint.w)];
	//mat4 m44World = m44Skin;
	mat4 m44World = u_m44World * m44Skin;
	//mat4 m44World = u_m44World * u_m44WorldInverse * m44Skin;
#else
#ifdef USE_TRANSFORM
	mat4 m44World = u_m44World;
#endif
#endif

#ifdef USE_TRANSFORM
	vec3 v3CameraPos = vec3(u_m44View[0][3], u_m44View[1][3], u_m44View[2][3]);
#endif

#ifdef USE_PARTICLE
	v_v4Particle = i_v4Particle;

	vec3 v3CameraRight = vec3(u_m44View[0][0], u_m44View[1][0], u_m44View[2][0]);
	vec3 v3CameraUp = vec3(u_m44View[0][1], u_m44View[1][1], u_m44View[2][1]);
	vec3 v3CameraAt = vec3(u_m44View[0][2], u_m44View[1][2], u_m44View[2][2]);

	float time = v_v4Particle.x + u_v4Particle.x;
	vec3 v3Scale = i_v3Scale + i_v3ScaleVelocity * time;
	vec4 v4Rotation = i_v4Orientation + i_v4AngularVelocity * time;

	float a2 = 0.5 * v4Rotation.w;
	float sina = sin(a2);
	float qx = v3CameraAt.x * sina;
	float qy = v3CameraAt.y * sina;
	float qz = v3CameraAt.z * sina;
	float qw = cos(a2);

	float qxx = 2.0 * qx * qx;
	float qxy = 2.0 * qx * qy;
	float qxz = 2.0 * qx * qz;
	float qxw = 2.0 * qx * qw;
	float qyy = 2.0 * qy * qy;
	float qyz = 2.0 * qy * qz;
	float qyw = 2.0 * qy * qw;
	float qzz = 2.0 * qz * qz;
	float qzw = 2.0 * qz * qw;

	mat3 rot;
	rot[0][0] = 1.0 - qyy - qzz;
	rot[0][1] = qxy + qzw;
	rot[0][2] = qxz - qyw;

	rot[1][0] = qxy - qzw;
	rot[1][1] = 1.0 - qxx - qzz;
	rot[1][2] = qyz + qxw;

	rot[2][0] = qxz + qyw;
	rot[2][1] = qyz - qxw;
	rot[2][2] = 1.0 - qxx - qyy;



	int i = gl_VertexID;
	vec3 v3Position = vec3(0, 0, 0);
	v3Position += v3CameraRight * v3Scale.x * (i%2==0 ? -1.0 : 1.0);
	v3Position += v3CameraUp * v3Scale.y * ((i%4)<2 ? -1.0 : 1.0);
	v3Position = rot * v3Position;

	v3Position += i_v3Position + i_v3Velocity * time;
	vec4 v4Position = vec4(v3Position, 1);
#else
	vec4 v4Position = vec4(i_v3Position, 1);
#endif

#ifdef USE_TRANSFORM
	vec4 v4ProjPos = u_m44Projection * u_m44View * m44World * v4Position;
	gl_Position = v4ProjPos;
	v_v3Position = (m44World * v4Position).xyz;
	v_v2Screen = v4ProjPos.xy;
	v_v4Distance = vec4((m44World * v4Position).rgb - v3CameraPos, v4ProjPos.z);
#else
	gl_Position = v4Position;
	v_v3Position = v4Position.xyz;
	v_v2Screen = v4Position.xy;
#endif

#ifdef USE_TEXCOORD
	v_v2Texcoord = i_v2Texcoord;
#endif
#ifdef USE_NORMAL
#ifdef USE_TANGENT_VTX
	vec3 normalW = normalize(mat3(m44World) * i_v3Normal.xyz); // TODO : use normal inverse tranpose
	vec3 tangentW = normalize(mat3(m44World) * i_v4Tangent.rgb);
	vec3 bitangentW = cross(normalW, tangentW) * i_v4Tangent.w;
	v_m3Tbn = mat3(tangentW, bitangentW, normalW);
#else
	v_v3Normal = normalize(mat3(m44World) * i_v3Normal);
#endif
#endif

#ifdef USE_COLOR_VTX
	v_v4Color = i_v4Color;
#endif
}
