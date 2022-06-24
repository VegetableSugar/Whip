//
//  ItemDetailView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var showModal: Bool
    @State var isRemove = true

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("50,000원")
                        .font(.system(size: 30))
                    
                    Text("명세서 I 인식 금액 50,000원")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                }
                Spacer()
                
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        self.showModal = false
                    }
            }
            .padding(.top, 52)
            
            self.kindLine
                .padding(.top, 16)
            
            self.categoryLine
            
            self.tradePlaceLine
            
            self.paymentLine
            
            self.dateLine
            
            self.memoLine
            
            self.removeToggle
            Spacer()
            
            self.saveButton
        }
        .padding(.horizontal, 24)
    }
}

extension ItemDetailView {
    @ViewBuilder
    var lineNextIcon: some View {
        Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 6, height: 12)
            .foregroundColor(.gray)
    }
    
    @ViewBuilder
    var saveButton: some View {
        Button(action: {
            self.showModal = false
        }) {
            Text("저장하기")
                .bold()
        }
        .buttonStyle(
            BigButtonStyle(
                fontSize: 18,
                fontColor: .white,
                backgroundColor: .carrot
            )
        )
        .padding(.horizontal, 24)
    }
    
    @ViewBuilder
    func kindText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 16))
            .bold()
            .foregroundColor(.gray)
    }
    
    @ViewBuilder
    var kindLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("분류")
                Spacer()
                
                self.lineNextIcon
            }
            Divider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var categoryLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("카테고리")
                Spacer()
                
                self.lineNextIcon
            }
            Divider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var tradePlaceLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("거래처")
                
                Text("(주)스타벅스커피 코리아")
                    .padding(.leading, 32)
                Spacer()
                
                self.lineNextIcon
            }
            Divider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var paymentLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("결제수단")
                
                Text("부자되세요 더 마일리지카드(체크)")
                    .padding(.leading, 20)
                Spacer()
                
                self.lineNextIcon
            }
            Divider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var dateLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("날짜")
                
                Text("2022년 6월 24일 오후 3:13")
                    .padding(.leading, 48)
                Spacer()
                
                self.lineNextIcon
            }
            Divider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var memoLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("메모")
                
                Text("메모 및 #태그를 입력해주세요")
                    .foregroundColor(.gray)
                    .padding(.leading, 48)
                Spacer()
                
                self.lineNextIcon
            }
            Divider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var removeToggle: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("예산에서 제외")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                
                if self.isRemove {
                    Text("이 내역을 예산에 포함하지 않습니다")
                        .font(.system(size: 12))
                        .foregroundColor(.carrot)
                        .lineLimit(1)
                        .padding(.top, 4)
                }
            }
            Spacer()
            
            Toggle(isOn: self.$isRemove, label: { })
                .frame(width: 120)
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(showModal: .constant(false))
    }
}
