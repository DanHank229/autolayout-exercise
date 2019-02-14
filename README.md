# autolayout-exercise
auto layout exercise, use storybord and code produce

:::success
2019/ 2/ 13
:::

---

## 目標：
產生四個View 在畫面旋轉時保持相對位置

## 條件
1. 兩個高寬為10x20的view1, 2 分別在畫面左上以及右上 離safe area 距離都是10
2. 高寬都為50的view3 位置放置畫面中心
3. 高寬為view3 兩倍的view 距離view3距離30的下方

---

## 使用storyboard
- 拉出4個view
- 上方兩個各自設定Constrain 以及Width Height
- 中間設定好view的大小後 選擇Align裡的水平 垂直置中
- 最後一個設定和上面元件相隔30 並拉線上去 
- 選擇Equal Widths 以及Equal Heights 並把Multiplier設定為2
完成示意
![]()

----

### 問題點

沒啥問題 
只需要注意順序就好

---

## 使用程式碼產生

先來中間與下面的

``` swift
func simpleView1() {
        let containerView1 = UIView()
        containerView1.backgroundColor = UIColor.yellow
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView1)
        
        
        let centerHorizontally =
                               // 要設定的元件
            NSLayoutConstraint(item: containerView1,
                               // 約束類型 （centerX為x軸致置中)
                               attribute: .centerX,
                               // attribute設定與其他視圖attribute的關係 可讓第一個參數<>=下個參數值
                               relatedBy: .equal,
                               // 參考視圖 目前以view本身來當參考
                               toItem: self.view,
                               // attribute參數(第二個)是參考視圖(在這裡為self.view)的constraint type
                               attribute: .centerX,
                               // multiplier參數將第二個attribute參數的值乘以另一個做為參數給定的值 預設1.0
                               multiplier: 1.0,
                               // 偏離 會加入attribute裡面計算
                               constant: 0.0)
        
        let centerVertically =
            NSLayoutConstraint(item: containerView1,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0)
        // 寬
        NSLayoutConstraint(item: containerView1,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 50.0).isActive = true
        // 高
        NSLayoutConstraint(item: containerView1,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 50.0).isActive = true
        NSLayoutConstraint.activate([centerHorizontally, centerVertically])
        
        let containerView2 = UIView()
        containerView2.backgroundColor = UIColor.black
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView2)
        
        
        NSLayoutConstraint(item: containerView2, attribute: .centerX,
                           relatedBy: .equal, toItem: self.view,
                           attribute: .centerX, multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: containerView2, attribute: .top,
                           relatedBy: .equal, toItem: containerView1,
                           attribute: .bottom, multiplier: 1.0,
                           constant: 30.0).isActive = true
        NSLayoutConstraint(item: containerView2, attribute: .width,
                           relatedBy: .equal, toItem: containerView1,
                           attribute: .width, multiplier: 2.0,
                           constant: 0.0).isActive = true
        NSLayoutConstraint(item: containerView2, attribute: .height,
                           relatedBy: .equal, toItem: containerView1,
                           attribute: .height, multiplier: 2.0,
                           constant: 0.0).isActive = true
    }
```

因為需要以containerView1來當參考點 故寫在同個func

----

再來左上

``` swift
func leftTopView() {
        let leftView = UIView()
        // safeArea 當作參考點用
        let layoutguid = view.safeAreaLayoutGuide
        leftView.backgroundColor = UIColor.green
        // ios自動約束條件關閉 以避免衝突
        leftView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftView)
        
        // 靠左 偏移量 10
        let centerHorizontally =
            NSLayoutConstraint(item: leftView,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 10)
        // 靠上 偏移量10
        let centerVertically =
            NSLayoutConstraint(item: leftView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 10.0)
        // 元件寬度                       
        NSLayoutConstraint(item: leftView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 20).isActive = true
        // 元件高度                   
        NSLayoutConstraint(item: leftView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 10).isActive = true
        // 啟動 Constraint
        NSLayoutConstraint.activate([centerHorizontally, centerVertically])
    }
```

右上如法泡製

----

### 問題點

----

看懂了以後設定很明確
不過當元件一多時
程式碼會爆炸長

---

## 改些條件
將左上右上置中水平放置
中間留出一個view寬的間隔

----

``` swift
func leftTopView() {
        
        let leftViewHeight: CGFloat = 10
        let leftViewWidth: CGFloat = 20
        let leftView = UIView()
        let layoutguid = view.safeAreaLayoutGuide
        leftView.backgroundColor = UIColor.green
        leftView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftView)
        
        let centerHorizontally =
            NSLayoutConstraint(item: leftView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: -(leftViewWidth))
        
        let centerVertically =
            NSLayoutConstraint(item: leftView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 10.0)
        NSLayoutConstraint(item: leftView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: leftViewWidth).isActive = true
        NSLayoutConstraint(item: leftView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: leftViewHeight).isActive = true
        
        NSLayoutConstraint.activate([centerHorizontally, centerVertically])
    }
```

----

### 改動
添加了 
``` swift
let leftViewHeight: CGFloat = 10
let leftViewWidth: CGFloat = 20
```

將元件寬來當作偏移量條件
可是抓不到元件的寬高屬性
故直接設定上去

---

### 參考來源

[Swift 新手系列之三：Auto Layout 介紹](https://www.appcoda.com.tw/auto-layout-programmatically/)

---
