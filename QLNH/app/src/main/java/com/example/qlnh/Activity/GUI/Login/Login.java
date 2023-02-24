package com.example.qlnh.Activity.GUI.Login;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;

import com.example.qlnh.Activity.GUI.Main.Activity;
import com.example.qlnh.R;

public class Login extends AppCompatActivity {
    boolean Click = false;
    EditText ed_taikhoan,ed_matkhau;
    AppCompatButton btn_DangNhap;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);
        Controls();
        Events();

    }

    //ánh xạ
    private void Controls()
    {
        ed_taikhoan = findViewById(R.id.ed_taikhoan);
        ed_matkhau = findViewById(R.id.ed_matkhau);
        btn_DangNhap = findViewById(R.id.btn_dangnhap);

    }
    //sử lí sử kiện
    private void Events()
    {
        //ẩn hiện mật khẩu
        ed_matkhau.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                //765 813
                int toado  = (int) motionEvent.getRawX();
                if(motionEvent.getAction() == motionEvent.ACTION_UP)
                {
                    if(Click == true && toado > 900 && toado < 935)
                    {

                        Click = false;
                        ed_matkhau.setCompoundDrawablesWithIntrinsicBounds(getDrawable(R.drawable.key),null,getResources().getDrawable(R.drawable.hidden),null);
                        ed_matkhau.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);

                    } else if
                    (Click == false && toado > 900 && toado < 935)
                    {

                        Click = true;
                        ed_matkhau.setInputType(InputType.TYPE_CLASS_TEXT);
                        ed_matkhau.setCompoundDrawablesWithIntrinsicBounds(getDrawable(R.drawable.key),null,getDrawable(R.drawable.eye),null);

                    }
                    return false;
                }

                return false;
            }

        });

        //đăng nhập
        btn_DangNhap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String taikhoan = ed_taikhoan.getText().toString();
                String matkhau = ed_matkhau.getText().toString();

                if(!taikhoan.isEmpty() && !matkhau.isEmpty())
                {
                    startActivity(new Intent(getApplicationContext(), Activity.class));

                }
                else{
                    Toast.makeText(Login.this, "Vui lòng nhập đầy đủ để đăng nhập", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}
