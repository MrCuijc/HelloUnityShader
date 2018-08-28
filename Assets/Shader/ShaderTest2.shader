Shader "Custom/ShaderTest2"
 {
		Properties
		{

			_EmissiveColor("Emissive Color",Color) = (1,1,1,1)
			_AmbientColor("Ambient Color",Color) = (1,1,1,1)
			_ColorSlider("Slider",Range(0,10)) = 2

		}

		SubShader
		{
			Tags{"RenderType"="Opaque"}
			LOD 200
			CGPROGRAM
			#pragam suface surf Lambert

			float4 _EmissiveColor;
			float4 _AmbientColor;
			float _ColorSlider;

			struct Input
			{
				float2 uv_MainTex;
			};

			void surf(Input IN, inout SurfaceOutput o)
			{
				float4 c = pow((_EmissiveColor + _AmbientColor),_ColorSlider);
				o.Albedo = c.rgb;
				o.Alpha = c.a;
			}
			ENDCG
		}

		Fallback "Diffuse"
}
