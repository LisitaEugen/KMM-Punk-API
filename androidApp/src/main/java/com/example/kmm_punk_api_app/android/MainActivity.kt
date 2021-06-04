package com.example.kmm_punk_api_app.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import com.example.kmm_punk_api_app.PunkAPI
import android.widget.TextView
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch


class MainActivity : AppCompatActivity() {
    private val punkAPI = PunkAPI()
    private val mainScope = MainScope()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val tv: TextView = findViewById(R.id.text_view)
        val button: Button = findViewById(R.id.button)

        button.setOnClickListener(
            View.OnClickListener {
                mainScope.launch {
                    kotlin.runCatching {
                        tv.text = "Loading..."
                        punkAPI.client.beersRandomGet().first().name
                    }.onSuccess {
                        tv.text = it
                    }.onFailure {
                        tv.text = "Error ${it.localizedMessage}"
                    }
                }
            }
        )


        mainScope.launch {
            kotlin.runCatching {
                tv.text = "Loading..."
                punkAPI.client.beersRandomGet().first().name
            }.onSuccess {
                tv.text = it
            }.onFailure {
                tv.text = "Error ${it.localizedMessage}"
            }
        }
    }
}
