using StoreApp.Helper;
using StoreApp.Models.DTOs;
using StoreApp.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Essentials;

namespace StoreApp.ViewModels
{
    public class LoginViewModel:BaseViewModel
    {

        HttpHelper http = new HttpHelper();
        public string email { get; set; }

        public string password { get; set; }

        public string validationMsg { get; set; } = "";
        public bool showValidationMsg { get; set; } = false;

        public Command DoLogin { get; set; }

        public LoginViewModel()
        {

            DoLogin = new Command(async()=>await Login());
        }

        private async Task Login()
        {

            LoginRqstDTO loginInfo = new LoginRqstDTO();
            loginInfo.Email = email;
            loginInfo.Password = password;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password)) {

                ShowErrorMessage("Debe diligenciar un correo y una cotraseña");
            }

            LoginRespDTO response = await http.Login(loginInfo);
            if (!response.Success)
            {
                ShowErrorMessage("Usuario o contraseña inválidos");
                return;
            }


            Preferences.Set("id", response.Id);
            Preferences.Set("first_name", response.FirstName);
            Preferences.Set("last_name", response.LastName);
            Preferences.Set("email", response.Email);
            Preferences.Set("address", response.Address);
            Preferences.Set("role", response.Role);

            Console.WriteLine("------>ROL:" + response.Role);
            var previousPage = Application.Current.MainPage.Navigation.NavigationStack.LastOrDefault();

            if (response.Role == 1)
            {
                await Application.Current.MainPage.Navigation.PushAsync(new AdminPage());
            }
            Application.Current.MainPage.Navigation.RemovePage(previousPage);


        }


        private void ShowErrorMessage(string message) {
            validationMsg = message;
            showValidationMsg = true;

            Task.Run(() => {
                Thread.Sleep(4000);
                showValidationMsg = false;
            });
        }
    }
}
