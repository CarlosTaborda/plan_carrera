using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using StoreApp.Models.DTOs;
using System.Threading.Tasks;
using System.Text.Json;

namespace StoreApp.Helper
{
    public class HttpHelper
    {

        HttpClient client;
        JsonSerializerOptions options = new JsonSerializerOptions() { PropertyNameCaseInsensitive = true };
        private static string baseUrl = "http://192.168.1.5/StoreApi/api";

        public HttpHelper() {
            client = new HttpClient();
        }


        public async Task<LoginRespDTO> Login(LoginRqstDTO loginInfo) {

            string endpoint = "/User";
            string serializedInfo = JsonSerializer.Serialize(loginInfo);
            StringContent content = new StringContent(serializedInfo, Encoding.UTF8, "application/json");
            var response = await client.PostAsync($"{baseUrl}{endpoint}", content);
            string respJson = await response.Content.ReadAsStringAsync();
            LoginRespDTO resp =  JsonSerializer.Deserialize<LoginRespDTO>(respJson, options);

            return resp;

        }
    }
}
