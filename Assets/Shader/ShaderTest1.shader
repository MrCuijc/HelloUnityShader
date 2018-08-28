Shader "Custom/ShaderTest1" {
	Properties{
		_MainTex("Base",2D) = "white"{}
	}
	SubShader{
		Tags{"RenderType"="Opaque"}
		LOD 200
		CGPROGRAM
		//声明一个函数入口 surf 
		#pragma surface surf Lambert

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			//计算纹理与uv混合的颜色值，4维数组
			half4 c = tex2D(_MainTex,IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Diffuse"
}
