package com.example.qlnh.Activity.GUI.Adapter;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.lifecycle.Lifecycle;
import androidx.viewpager2.adapter.FragmentStateAdapter;

import com.example.qlnh.Activity.GUI.Fragment.GoiMon;
import com.example.qlnh.Activity.GUI.Fragment.Sodo;
import com.example.qlnh.Activity.GUI.Fragment.Tienich;

public class ViewPagerAdapter extends FragmentStateAdapter {


    public ViewPagerAdapter(@NonNull FragmentActivity fragmentActivity) {
        super(fragmentActivity);
    }

    @NonNull
    @Override
    public Fragment createFragment(int position) {
        switch (position)
        {
            case 0:
                return new Sodo();
            case 1:
                return new GoiMon();
            case 2:
                return new Tienich();
            default:
                return new Sodo();

        }

    }

    @Override
    public int getItemCount() {
        return 3;
    }
}
