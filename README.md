# flutter_android_density

A Flutter plugin allows getting Android density.

## Supported Methods

| Static method name | Description |
|--------------------|-------------|
| `getDensity()`     | Equivalent to [DisplayMetrics.density](https://developer.android.com/reference/android/util/DisplayMetrics#density) |
| `getDensityDpi()`  | Equivalent to [DisplayMetrics.densityDpi](https://developer.android.com/reference/android/util/DisplayMetrics#densityDpi) |

#### Static variables

* `density`: Contains all the [DisplayMetrics constants](https://developer.android.com/reference/android/util/DisplayMetrics#Summary:~:text=Summary-,Constants,-int)

#### Utilities

| Static method name | Description |
|--------------------|-------------|
| `getPixels()`      | Get `1dp` in pixels, based on density scale |
| `getScalePixels()` | Get `1dp` in `sp`, based on density scale |
| `getPoint`         | Get `1dp` in `pt` |