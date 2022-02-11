﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace StoreApp.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AdminPage : FlyoutPage
    {
        public AdminPage()
        {
            InitializeComponent();
            FlyoutPage.ListView.ItemSelected += ListView_ItemSelected;
            
        }

        private void ListView_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            var item = e.SelectedItem as AdminPageFlyoutMenuItem;
            if (item == null)
                return;

            var page = (Page)Activator.CreateInstance(item.TargetType);
            page.Title = item.Title;

            Detail = new NavigationPage(page);
            IsPresented = false;

            FlyoutPage.ListView.SelectedItem = null;
        }
    }
}