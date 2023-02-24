package com.example.qlnh.Activity.GUI.Main;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.ContentView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager2.widget.ViewPager2;

import com.example.qlnh.Activity.GUI.Adapter.ViewPagerAdapter;
import com.example.qlnh.R;
import com.google.android.material.badge.BadgeDrawable;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class Activity extends AppCompatActivity {
    ViewPager2 viewPager2;
    BottomNavigationView bottomNavigationView;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Addcontrols();
        AddEvents();
    }

    private void AddEvents() {
        // sự kiện khi kéo màn hình đổi theo
        viewPager2.registerOnPageChangeCallback(new ViewPager2.OnPageChangeCallback() {
            @Override
            public void onPageSelected(int position) {
                super.onPageSelected(position);
                switch (position)
                {
                    case 0:
                        bottomNavigationView.getMenu().findItem(R.id.btn_home).setChecked(true);
                        break;
                    case 1:
                        bottomNavigationView.getMenu().findItem(R.id.btn_goimon).setChecked(true);
                        break;
                    case 2:
                        bottomNavigationView.getMenu().findItem(R.id.btn_tienich).setChecked(true);
                        break;
                }
            }
        });

        bottomNavigationView.setOnItemSelectedListener(new NavigationBarView.OnItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                switch (item.getItemId())
                {
                    case R.id.btn_home:
                        viewPager2.setCurrentItem(0);
                        break;
                    case R.id.btn_goimon:
                        viewPager2.setCurrentItem(1);
                        break;
                    case R.id.btn_tienich:
                        viewPager2.setCurrentItem(2);
                        break;
                }

                return true;
            }
        });
    }

    //ánh xạ
    private void Addcontrols() {
        viewPager2 = findViewById(R.id.ViewPageer2);
        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        createAdapter();
    }

    private void createAdapter() {
        ViewPagerAdapter viewPagerAdapter = new ViewPagerAdapter(this);
        viewPager2.setAdapter(viewPagerAdapter);
    }
}
