//
//  ContentView.swift
//  tab_view
//
//  Created by shu yanping on 2024/5/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainTabView: View {

    @State private var selectedTab = 1
    @State private var lastSelectedTab = 1  // 存储最后一个被选中的Tab
    @State private var showActionSheet = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("主页", systemImage: "list.dash")
                            .font(.system(size: 80))
                    }
                    .tag(0)

                SearchView()
                    .tabItem {
                        Label("Tab 2", systemImage: "list.dash")
                    }
                    .tag(1)
                
                Spacer()
                    .tabItem {
                        EmptyView()
                    }
                    .tag(2)
                
                SettingsView()
                    .tabItem {
                        Label("Tab 3", systemImage: "square.and.pencil")
                    }
                    .tag(3)
                
                OtherView()
                    .tabItem {
                        Label("Tab 4", systemImage: "square.and.pencil")
                    }
                    .tag(4)
                
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("操作"), message: Text("选择一个操作"), buttons: [
                    .default(Text("操作一")) { print("操作一被执行") },
                    .default(Text("操作二")) { print("操作二被执行") },
                    .cancel()
                ])
            }
            
            Button {
                showActionSheet = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30, weight: .semibold))
                    //.foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
            
        }
        .ignoresSafeArea(.keyboard) // usefull so the button doesn't move around on keyboard show
        .onChange(of: selectedTab) { oldValue, newValue in
           if newValue == 2 { // replace 2 with your index
               selectedTab = lastSelectedTab  // 保持在当前Tab
               showActionSheet = true
               self.selectedTab = selectedTab // reset the selection in case we somehow press the middle tab
           }
        }
    }
}

struct PlainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 70, height: 70)
            .background(Color.green)
            .clipShape(Circle())
            .contentShape(Circle())  // 确保点击区域也是圆形
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)  // Optional: add a slight scale effect
    }
}


struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
                Text("首页视图")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)  // 撑满整个可用空间
            .background(Color.red)  // 将背景色设置在VStack内部
        }
        .ignoresSafeArea(edges: .bottom)  // 确保ScrollView撑满整个Tab，包括安全区域
        //.background(Color.red) 这一条不能加，否则底部向上拉的时候会出现红色
        .padding(.top, 1)  // 如果需要，还可以在这里调整padding，为什么？？
    }
}
struct SearchView: View {
    var body: some View {
        Text("搜索视图")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("设置视图")
    }
}

struct OtherView: View {
    var body: some View {
        Text("其他视图")
    }
}

struct DetailView: View {
    var body: some View {
        Text("Here are the details!")
    }
}

#Preview {
    MainTabView()
}
