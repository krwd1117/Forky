import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                
                TabBarTabView(
                    selectedTab: $selectedTab,
                    tab: tab
                )
                
                Spacer()
            }
        }
        .frame(height: 60)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
        }
    }
} 

fileprivate struct TabBarTabView: View {
    
    @Binding var selectedTab: Tab
    var tab: Tab
    
    var body: some View {
        if tab == .fork {
            VStack(spacing: 4) {
                Image(systemName: selectedTab == tab ? tab.selectedIcon : tab.icon)
                    .font(.system(size: 24))
            }
            .foregroundColor(selectedTab == tab ? .blue : .gray)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedTab = tab
                }
            }
        } else {
            VStack(spacing: 4) {
                Image(systemName: selectedTab == tab ? tab.selectedIcon : tab.icon)
                    .font(.system(size: 24))
            }
            .foregroundColor(selectedTab == tab ? .blue : .gray)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedTab = tab
                }
            }
        }
    }
}
