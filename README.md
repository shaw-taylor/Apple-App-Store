# Apple App Store Data
This project analyzes Apple App Store data, offering insights for aspiring developers. Utilizing SQL, i examined app categories, pricing strategies, and user ratings.

![trust_payments__exlcink996uu_large_2x](https://github.com/nanli-7/app-store-apple-data/assets/150867356/eb570e6b-9442-4e41-8df4-a4d90470b81e)

## Dataset Overview
The dataset, sourced from Kaggle, consists of two tables: 'AppleStore.csv' and 'appleStore_description.csv.' Collected in July 2017, it unveils the dynamic Apple iOS app store landscape with details on 7,000+ mobile applications, including app names, sizes, prices, and user ratings.

## Dataset Content:

__appleStore.csv__

1. "id" : App ID
2. "track_name": App Name
3. "size_bytes": Size (in Bytes)
4. "currency": Currency Type
5. "price": Price amount
6. "rating_count_tot": User Rating counts (for all version)
7. "rating_count_ver": User Rating counts (for current version)
8. "user_rating" : Average User Rating value (for all version)
9. "user_rating_ver": Average User Rating value (for current version)
10. "ver" : Latest version code
11. "cont_rating": Content Rating
12. "prime_genre": Primary Genre
13. "sup_devices.num": Number of supporting devices
14. "ipadSc_urls.num": Number of screenshots showed for display
15. "lang.num": Number of supported languages
16. "vpp_lic": Vpp Device Based Licensing Enabled

__appleStore_description.csv__

1. id : App ID
2. track_name: Application name
3. size_bytes: Memory size (in Bytes)
4. app_desc: Application description

[Link to Dataset](https://www.kaggle.com/datasets/ramamet4/app-store-apple-data-set-10k-app)

## Key Insights:

__Popular Genres__: Games and entertainment dominate, with games alone exceeding 3000 apps. While these genres are competitive, they reflect user preferences.

__Paid Apps' Ratings__: Paid apps tend to have higher ratings than free ones, suggesting users perceive higher value. Developers can experiment with pricing tiers and premium versions.

__Language Support__: Apps supporting 10–30 languages have higher ratings. Focus on including widely used languages instead of an extensive list for better user engagement.

__App Description Impact__: Longer app descriptions correlate with higher user ratings. Detailed descriptions provide transparency, aiding users in making informed decisions, potentially leading to higher satisfaction.

## How to Use the Project:
To simplify analysis, we recommend SQLite online for its user-friendly interface and no installation requirements. SQL capabilities can be directly utilized. However, any other SQL database can be employed

Given SQLite's 4MB file limit, the large 'apple_store_description.csv' was split into four smaller files, each within upload limits. The SQL UNION ALL operation effectively merges them, ensuring efficient utilization of the entire dataset for thorough analysis within SQLite online's constraints. 
