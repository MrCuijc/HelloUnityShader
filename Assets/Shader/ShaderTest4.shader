Shader "Custom/ShaderTest4" {
	Properties{
		_Emi("Emissive",Color) = (1,1,1,1)
		_Am("Ambient",Color) = (1,1,1,1)
		_Slider("Range",Range(0,10)) = 2
	}

	SubShader{

		Tags{"RenderType"="Opaque"}
		LOD 200
		CGPROGRAM
		#pragma surface suf MyLig

		inline float4 LightingMyLig(SurfaceOutput s, fixed3 lightDir, fixed atten)
		{
			float diff = dot (s.Normal,lightDir);
			float half = (diff * 0.5) + 0.5;
			float4 col;
			col.rgb = s.Albedo * _LightColor0.rgb * (diff * atten *2);
			col.a = s.Alpha;
			return col;
		}

		float4 _Emi;
		float4 _Am;
		float4 _Slider;

		struct Input{
			float2 uv_MainTex;

		};

		void suf(Input IN, inout SurfaceOutput o)
		{
			float4 c = pow((_Emi + _Am),_Slider);
			o.Albedo = c.rgb;
			o.Alpha = c.a;

		}
		ENDCG
	}

	Fallback "Disffuse"

}
