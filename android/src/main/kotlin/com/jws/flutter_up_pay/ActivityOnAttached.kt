package com.jws.flutter_up_pay

import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/**
 *
 * @ClassName: ActivityOnAttached
 * @Author: apple
 * @Description:
 * @CreateTime: 2023/4/23 14:55
 * @Version: 1.0
 */
abstract class ActivityOnAttached : ActivityAware {

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onDetachedFromActivity() {
    }
}